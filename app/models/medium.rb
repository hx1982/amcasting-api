class Medium < ApplicationRecord
  belongs_to :medium_type
  has_one :medium_detail, dependent: :destroy

  #Please refer to AWS presets
  #https://console.aws.amazon.com/elastictranscoder/home?region=us-west-1#presets:
  VIDEO_ENCODING_PRESETS = {
    web: {id: '1351620000001-100070', name: 'System preset: Web', format: 'mp4'},
    mobile: {id: '1351620000001-100020', name: 'System preset: iPhone4S', format: 'mp4'},
    HD: {id: '1351620000001-000010', name: 'System preset: Generic 720p', format: 'mp4'}
  }

  AUDIO_ENCODING_PRESETS = {
    web: {id: '1351620000001-300020', name: 'System preset: Audio MP3 - 192k', format: 'mp3'}
  }


  #validation
  # validates_presence_of :medium_type, :file_path,
  #   :file_name, :file_type

  mount_uploader :asset, MediumUploader

  def audio?
    medium_type.code == 'AUD'
  end

  def video?
    medium_type.code == 'VID'
  end

  def image?
    medium_type.code == 'PHOT'
  end


end
