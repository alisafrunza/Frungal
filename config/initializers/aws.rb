Aws.config.update({
  region: 'us-east-1',
  credentials: Aws::Credentials.new(Rails.application.credentials.dig(:amazon, :access_key_id), Rails.application.credentials.dig(:amazon, :secret_access_key)),
})

S3_BUCKET = Aws::S3::Resource.new.bucket(Rails.application.credentials.dig(:amazon, :bucket))
