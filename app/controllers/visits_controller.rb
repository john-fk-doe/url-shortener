class VisitsController < ApplicationController
  def index
    @visits = Visit.order('created_at DESC').limit(100).includes(:link)
  end

  def stats
    @total_visits = Visit.count
    @uniq_visits = Visit.pluck(:link_id).uniq.count
    @grouped_by_location= Visit.group(:location).count.sort_by {|k,v| v}.reverse
    @grouped_by_link = Visit.group(:link).count.sort_by {|k,v| v}.reverse
  end
end
