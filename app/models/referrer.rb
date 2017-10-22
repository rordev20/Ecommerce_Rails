class Referrer < ApplicationRecord
  acts_as_paranoid
  has_many :referreds
  validates :name, presence: true
  validates :email, presence: true, email: true
end
