class BannerCountry < ActiveRecord::Base
  belongs_to :banner
  belongs_to :country
end
