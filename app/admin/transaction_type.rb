ActiveAdmin.register TransactionType do
  menu parent: "Brownie", priority: 2
  permit_params :name, :is_active, :deleted_at

end
