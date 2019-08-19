class Link < ApplicationRecord
  has_many :visits

  validates_presence_of :original

  before_create :set_short
  after_create :create_cache_key

  def self.find_shorten!(short_url)
    Rails.cache.fetch(short_url) { Link.find_by_short!(short_url) }
  end

  private

  def set_short
    self.short = generate_short
  end

  def generate_short
    loop do
      short_url = SecureRandom::base58(8)
      break short_url unless Link.where(short: short_url).exists?
    end
  end

  def create_cache_key
    Rails.cache.write(short, self)
  end
end
