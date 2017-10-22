class BankAccount < ApplicationRecord
  acts_as_paranoid
  belongs_to :vendor
  validates :ifsc_code, :account_no, :bank_name, :name, :branch_name, presence: true
end
