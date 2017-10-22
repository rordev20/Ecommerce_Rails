class Referred < ApplicationRecord
  acts_as_paranoid
  belongs_to :referrer
  validates :name, presence: true
  validates :email, presence: true, email: true
end
