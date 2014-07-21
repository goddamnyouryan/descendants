class Medium < ActiveRecord::Base
  self.inheritance_column = nil

  DIRECT_UPLOAD_URL_FORMAT = %r{\Ahttps:\/\/s3\.amazonaws\.com\/descendants.#{Rails.env}/(?<path>uploads\/.+\/(?<filename>.+))\z}.freeze

  belongs_to :imageable, polymorphic: true

  has_attached_file :attachment
  do_not_validate_attachment_file_type :attachment

  validates :direct_upload_url, presence: true, format: { with: DIRECT_UPLOAD_URL_FORMAT }, if: :direct_upload_url?
  validates :imageable_id, :imageable_type, presence: true

  after_create :transfer_and_cleanup

  scope :images, -> { where(type: 'image') }

  def direct_upload_url?
    direct_upload_url.present?
  end

  def post_process_required?
    %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}.match(attachment_content_type).present?
  end

  def transfer_and_cleanup
    direct_upload_url_data = DIRECT_UPLOAD_URL_FORMAT.match(direct_upload_url)

    s3 = AWS::S3.new
    objects = s3.buckets[Rails.configuration.aws[:bucket]].objects

    if post_process_required?
      self.attachment = URI.parse direct_upload_url if direct_upload_url?
      self.type = 'image'
    else
      paperclip_file_path = "media/attachments/#{id}/original/#{direct_upload_url_data[:filename]}"
      objects[paperclip_file_path].copy_from(direct_upload_url_data[:path], acl: :public_read)
      self.type = attachment_content_type.split('/').last
    end

    self.processed = true
    self.save

    objects[direct_upload_url_data[:path]].delete
  end
  handle_asynchronously :transfer_and_cleanup
end
