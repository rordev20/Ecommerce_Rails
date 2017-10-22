ActiveAdmin.register Cart do
  menu parent: "Cart", priority: 1

  permit_params :user, :email, :coupon, :is_active, :deleted_at


  controller do
    def scoped_collection
      super.includes :user,:coupon
    end
  end

end
