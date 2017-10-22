ActiveAdmin.register State do
  menu parent: "Locality", priority: 2

  permit_params :name, :abbr, :country, :is_active, :deleted_at

  controller do
    def scoped_collection
      super.includes :country
    end
  end

end
