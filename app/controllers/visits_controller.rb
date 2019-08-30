class VisitsController < ApplicationController
  def index
    @visits = Rails.cache.fetch(:last_100, expires_in: 10.minutes) { Visit.last_n_with_links(100) }
  end

  def stats
    @total_visits = Visit.count
    @uniq_visits = Visit.distinct.pluck(:link_id).count
    @top_countries = Visit.by_country.most_popular
    @top_links = Visit.by_link.most_popular
  end
end
