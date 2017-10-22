ActiveAdmin.register Address do
  menu parent: "Address", priority: 2

  permit_params :user, :address1, :address2, :landmark, :city, :zipcode, :state, :country, :phone, :alt_phone, :vendor,
                :is_active, :deleted_at


  controller do
    def scoped_collection
      super.includes :country, :state, :address_type, :vendor, :user # prevents N+1 queries to your database
    end
  end

end
