class VisitsController < ApplicationController
  def index
    @visits = Visit.includes(:link).last(100).reverse
  end

  def stats
    @total_visits = Visit.count
    @uniq_visits = Visit.distinct.pluck(:link_id).count
    @top_countries = Visit.by_country.most_popular
    @top_links = Visit.by_link.most_popular
  end
end
