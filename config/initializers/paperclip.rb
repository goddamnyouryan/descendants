Paperclip::Attachment.default_options.merge!(
  url: ':s3_domain_url',
  path: ':class/:attachment/:id/:style/:filename',
  storage: :s3,
  s3_credentials: Rails.configuration.aws,
  s3_protocol: 'https',
  styles: { thumb: '285x160#', poster: '896x504#' }
)
