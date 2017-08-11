ActiveAdmin.register Size do
  includes :category

  index do
    column :name
    column :category
    column :created_at
    column :updated_at
    actions
  end   

end
