class CurrencyRate < ApplicationRecord
  acts_as_paranoid
  belongs_to :country
end
