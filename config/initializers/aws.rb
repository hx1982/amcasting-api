credentials = Aws::Credentials.new(
  Rails.application.secrets[:aws_access_id],
  Rails.application.secrets[:aws_access_secret]
)

Aws.config.update({
  region: Rails.application.secrets[:aws_region],
  credentials: credentials
})
