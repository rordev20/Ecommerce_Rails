class TransactionType < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  validates :name, presence: true, uniqueness: true
end
