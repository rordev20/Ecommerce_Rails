ActiveAdmin.register Color do
  menu parent: "Product", priority: 4

  permit_params :name, :code, :is_active, :deleted_at

end
