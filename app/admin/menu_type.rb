ActiveAdmin.register MenuType do
  menu parent: "Menu", priority: 1

  permit_params :name, :slug, :is_active

  form do |f|
    f.inputs "MenuType" do
      f.input :name
      f.input :is_active
    end
    f.actions
  end

end
