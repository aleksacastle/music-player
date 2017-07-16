require "carrierwave/orm/activerecord"
if Rails.env.test?

  # Setup Carrierwave to use local storage and disable file processing in test env
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  # make sure our uploader is auto-loaded
  SongUploader
  AvatarUploader

  # Separate out the upload folders for test environment.
  CarrierWave::Uploader::Base.descendants.each do |klass|
   next if klass.anonymous?
   klass.class_eval do
     def cache_dir
       "#{Rails.root}/spec/support/uploads/tmp"
     end

     def store_dir
       "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
     end
   end
 end

  # Setting asset_host
  CarrierWave.configure do |config|
    config.asset_host = ActionController::Base.asset_host
  end
end
