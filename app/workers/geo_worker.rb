class GeoWorker
  include Sidekiq::Worker

  sidekiq_options queue: :default

  def perform(visit_id, count)
    visit = Visit.find(visit_id)
    country = Geocoder.search(visit.ip).first&.country

    visit.update!(location: country)
  end
end
