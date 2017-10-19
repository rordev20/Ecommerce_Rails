class Country < ApplicationRecord
  acts_as_paranoid
  has_one :currency_rate
  has_many :states
  has_many :banner_countries
  has_many :banners, through: :banner_countries
  scope :active, -> {where(is_active: true)}

  after_save :expire_cache

  # This method return list of active countries
  def self.list_of_countries
    self.active
  end

  # This method return list of active states
  def list_of_states
    self.states.active
  end

  # get currency rate
  def self.get_rate(country_code)
    Rails.cache.fetch ["conversion_rate_", country_code], expires_in: 24.hours do
      currency_rate = self.find_by_iso_name(country_code).try(:currency_rate)
      currency_rate.present? ? currency_rate.rate : nil
    end
  end

  private

  def expire_cache
    Rails.cache.delete_matched("conversion_rate_*")
  end
end
