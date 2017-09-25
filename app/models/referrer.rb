class Referrer < ActiveRecord::Base
  acts_as_paranoid
  has_many :referreds
end
