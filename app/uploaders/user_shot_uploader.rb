class UserShotUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # create different versions of your uploads files:
  version :full do
    process resize_to_fit: [800, 600]
  end
  version :thumb do
    process resize_to_fit: [400, 300]
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end
end
