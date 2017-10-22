class CurrencyRate < ApplicationRecord
  acts_as_paranoid
  belongs_to :country
  validates_uniqueness_of :country_id
  validates_numericality_of :rate, :greater_than_or_equal_to => 0.003, presence: true
  validates_numericality_of :market_rate, :greater_than_or_equal_to => 0.003, presence: true
end
