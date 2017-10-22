ActiveAdmin.register MenuManager do
  menu parent: "Menu", priority: 2

  permit_params :name, :display_name, :slug, :url, :position, :open_in_new_tab, :menu_type_id, :sign_in_required, :is_active,
                :icon_class 

  form do |f|
    f.inputs "MenuManager" do
      f.input :menu_type
      f.input :name
      f.input :display_name
      f.input :position
      f.input :url
      f.input :icon_class
      f.input :open_in_new_tab
      f.input :sign_in_required
      f.input :is_active
    end
    f.actions
  end

  controller do
    def scoped_collection
      super.includes :menu_type
    end
  end

end
