class Referred < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :referrer
end
