Paperclip::Attachment.default_options.merge!(
  url: ':s3_domain_url',
  path: ':class/:attachment/:id/:style/:filename',
  storage: :s3,
  s3_credentials: Rails.configuration.aws,
  styles: { thumb: '285x160#', poster: '896x504#' }
)

if Rails.env.production?
  Paperclip::Attachment.default_options.merge!(
    s3_host_alias: 'uploads.descendants.tv',
    url: ':s3_alias_url'
  )
end
