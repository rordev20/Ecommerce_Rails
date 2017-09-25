class BankAccount < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :vendor
end
