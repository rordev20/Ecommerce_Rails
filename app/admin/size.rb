ActiveAdmin.register Size do
  menu parent: "Product", priority: 3
  includes :category

  index do
    column :name
    column :category
    column :created_at
    column :updated_at
    actions
  end

end
