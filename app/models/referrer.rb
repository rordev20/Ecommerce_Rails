class Referrer < ApplicationRecord
  acts_as_paranoid
  has_many :referreds
end
