require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: 'us-west-1'
  }

  config.fog_directory  = 'twitter-fake-upload'
  config.asset_host = 'https://s3-us-west-1.amazonaws.com/twitter-fake-upload'
end
