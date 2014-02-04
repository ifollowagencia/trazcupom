# encoding: utf-8
class UserUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick


  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [29, 29]
  end

  version :mini_thumb do
    process :resize_to_fill => [50, 50]
  end

  version :mega_thumb do
    process :resize_to_fill => [100, 100]
  end

  version :banner_thumb do
    process :resize_to_fill => [300, 300]
  end

  version :giga do
    process :resize_to_fill => [800, 800]
  end
 end
