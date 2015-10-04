CarrierWave.configure do |config|
  # config.fog_credentials = {
  #   # Configuration for Amazon S3 should be made available through an Environment variable.
  #   # For local installations, export the env variable through the shell OR
  #   # if using Passenger, set an Apache environment variable.
  #   #
  #   # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
  #   #
  #   # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=http://techshare-data.s3.amazonaws.com/device-pics
 
  #   # Configuration for Amazon S3
  #   :provider              => 'AWS',
  #   :aws_access_key_id     => ENV['S3_KEY'],
  #   :aws_secret_access_key => ENV['S3_SECRET'],
  #   # :region                => ENV['S3_REGION']
  # }
 
  # # For testing, upload files to local `tmp` folder.
  if Rails.env.test? || Rails.env.development?
    config.storage = :file
    config.enable_processing = false
    # config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
    # config.fog_provider = 'fog' #'fog/aws'                        # required
    config.fog_credentials = {
      :provider              => 'AWS',                     # required
      :aws_access_key_id     => ENV['S3_360MEDIA_KEY'],             # required
      :aws_secret_access_key => ENV['S3_360MEDIA_SECRET'],
      region:                'us-west-2',                  # optional, defaults to 'us-east-1'
      # host:                  's3.example.com',             # optional, defaults to nil
      # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = ENV['S3_360MEDIA_BUCKET_NAME']                          # required
    # config.fog_directory  = 'media360-pics'                          # required
    config.fog_public     = false                                        # optional, defaults to true
    # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
    config.fog_attributes = {} # optional, defaults to {}
  end

  # Testing s3 uploads locally
  # For testing, upload files to local `tmp` folder.
  # if Rails.env.test? || Rails.env.development?
  #   config.storage = :file
  #   config.enable_processing = false
  #   # config.root = "#{Rails.root}/tmp"
  # else
  #   config.storage = :fog
  #   # config.fog_provider = 'fog' #'fog/aws'                        # required
  #   config.fog_credentials = {
  #     :provider              => 'AWS',                     # required
  #     :aws_access_key_id     => ENV['S3_360MEDIA_KEY'],             # required
  #     :aws_secret_access_key => ENV['S3_360MEDIA_SECRET'],
  #     region:                'us-west-2',                  # optional, defaults to 'us-east-1'
  #     # host:                  's3.example.com',             # optional, defaults to nil
  #     # endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  #   }
  #   # config.fog_directory  = ENV['S3_360MEDIA_BUCKET_NAME']                          # required
  #   config.fog_directory  = 'media360-pics'                          # required
  #   config.fog_public     = false                                        # optional, defaults to true
  #   # config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
  #   config.fog_attributes = {} # optional, defaults to {}
  # end
end