class TransactionType < ActiveRecord::Base
  acts_as_paranoid
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
