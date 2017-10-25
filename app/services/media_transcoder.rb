MediaTranscoderError = Class.new(StandardError)

class MediaTranscoder
  attr_accessor :medium, :region, :pipeline

  def initialize(medium, region, pipeline)
    @medium = medium
    @region = region
    @pipeline = pipeline

    unless MediaTranscoder.supported_media_type?(medium)
      raise MediaTranscoderError.new('Unsupported Media Type')
    end
  end

  def async_transcode
    Resque.enqueue(MediaTranscoderWorker, medium.id, region, pipeline)
  end

  def transcode
    transcoder = Aws::ElasticTranscoder::Client.new(region: region)

    transcoder.create_job(
      pipeline_id: pipeline,
      input: construct_input_settings,
      outputs: construct_output_settings
    )
  end

  def self.supported_media_type?(medium)
    return true if medium.video? || medium.audio?
    false
  end

private
  def construct_input_settings
    {
      key: medium.asset.path
    }
  end

  def construct_output_settings
    encoding_presets.map do |key, preset|
      output_for_preset key, preset, medium
    end
  end

  #sample preset:
  # { id: '1351620000001-100070',
  #   name: 'System preset: Web',
  #   format: 'mp4'}
  def output_for_preset(preset_key, preset, medium)
    path = medium.asset.path

    {
      key: output_destination(preset_key, path, preset[:format]),
      preset_id: preset[:id],
      thumbnail_pattern: thumbnail_pattern(path)
    }
  end

  def thumbnail_pattern(path)
    file_name = File.basename(path, '.*')
    "#{File.dirname(path)}/#{file_name}-thumbnail-{count}" if medium.video?
  end

  #this is the file destination in s3
  def output_destination(key, path, extension)
    dir = File.dirname(path)
    file_name = File.basename(path, '.*')
    "#{dir}/#{key}/#{file_name}.#{extension}"
  end

  def encoding_presets
    return Medium::VIDEO_ENCODING_PRESETS if medium.video?
    return Medium::AUDIO_ENCODING_PRESETS if medium.audio?
    return nil
  end
end
