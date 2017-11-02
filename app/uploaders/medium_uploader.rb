class MediumUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    folder_name = 'photo' if model.medium_type.code == 'PHOT'
    folder_name = 'video' if model.medium_type.code == 'VID'
    folder_name = 'audio' if model.medium_type.code == 'AUD'
    "uploads/#{folder_name}/#{model.file_name[0..1]}/#{model.file_name[2..3]}/#{model.file_name[4..5]}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :jumbo, if: :image?
  version :home, if: :image?
  version :thumb, if: :image?
  version :mini, if: :image?
  #
  # jumbo default
  version :jumbo do
    process resize_to_fill: [600,800]
    process :convert => 'png'
    def full_filename (for_file = model.asset.file)
      "#{model.file_name}j.png"
    end
  end

  version :home do
    process resize_to_fill: [250,312]
    process :convert => 'png'
    def full_filename (for_file = model.asset.file)
      "#{model.file_name}h.png"
    end
  end

  version :thumb do
    process resize_to_fill: [125,156]
    process :convert => 'png'
    def full_filename (for_file = model.asset.file)
      "#{model.file_name}t.png"
    end
  end

  version :mini do
    process resize_to_fill: [75,94]
    process :convert => 'png'
    def full_filename (for_file = model.asset.file)
      "#{model.file_name}m.png"
    end
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    return "#{model.file_name}.mp4" if video? model.asset.file
    return "#{model.file_name}.mp3" if audio? model.asset.file
    return "#{model.file_name}.png" if image? model.asset.file
  end

private
  def image? file
    file.content_type.include? 'image'
  end

  def audio? file
    file.content_type.include? 'audio'
  end

  def video? file
    file.content_type.include? 'video'
  end

end
