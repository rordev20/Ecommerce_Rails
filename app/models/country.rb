class Country < ActiveRecord::Base
  has_one :currency_rate
end
