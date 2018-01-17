ActiveAdmin.register Tax do
  menu parent: "Master", priority: 4
  permit_params :name, :rate, :sub_category_id, :country_id, :min_range, :max_range, :is_active, :deleted_at

  controller do
    def scoped_collection
      super.includes :sub_category, :country # prevents N+1 queries to your database
    end
  end

end
