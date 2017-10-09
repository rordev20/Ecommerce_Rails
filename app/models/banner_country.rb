class BannerCountry < ApplicationRecord
  belongs_to :banner
  belongs_to :country
end
