class VendorOrder < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :user
  belongs_to :coupon
  belongs_to :cart
end
