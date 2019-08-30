class Visit < ApplicationRecord
  belongs_to :link

  scope :by_country, -> { group(:location) }
  scope :by_link, -> { joins(:link).group('links.original') }

  scope :last_n_with_links, -> (n) { includes(:link).last(n).reverse }

  def self.most_popular(number=10)
    order(count_id: :desc).limit(number).count(:id)
  end

  def self.cache_last_n_records(n)
    Rails.cache.write("last_#{n}", last_n_with_links(n))
  end
end
