class MediaTranscoderWorker
  extend Appsignal::Integrations::ResquePlugin
  @queue = :media_transcoder_worker

  def self.perform(medium_id, region, pipeline)
    medium = Medium.find medium_id
    MediaTranscoder.new(medium, region, pipeline).transcode
  end
end
