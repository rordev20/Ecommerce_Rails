ActiveAdmin.register BankAccount do

  permit_params :name, :bank_name, :branch_name, :ifsc_code, :account_no, :vendor, :is_active, :deleted_at

end
