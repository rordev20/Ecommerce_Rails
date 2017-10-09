class VendorOrder < ApplicationRecord
  acts_as_paranoid
  belongs_to :vendor
  belongs_to :user
  belongs_to :coupon
  belongs_to :cart
end
