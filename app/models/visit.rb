class Visit < ApplicationRecord
  belongs_to :link

  scope :by_country, -> { group(:location) }
  scope :by_link, -> { joins(:link).group('links.original') }

  def self.most_popular(number=10)
    order(count_id: :desc).limit(number).count(:id)
  end
end
