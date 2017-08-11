ActiveAdmin.register Category do

  permit_params :name, :description, :is_active, :deleted_at, sizes_attributes: [ :id, :name, :_destroy ]

  form do |f|
    f.inputs "Coupon" do
      f.input :name
      f.input :description
      f.has_many :sizes, heading: false, allow_destroy: true do |size|
        size.input :name
      end
      f.input :is_active
    end
    f.actions
  end
end
