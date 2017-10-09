class Referred < ApplicationRecord
  acts_as_paranoid
  belongs_to :referrer
end
