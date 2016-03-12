class SubsWorker
  include Sidekiq::Worker
  
  def perform(snippet_id)
  end
end