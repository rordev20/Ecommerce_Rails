ActiveAdmin.register BrowniePointTransaction do
  menu parent: "Brownie", priority: 1

  permit_params :user_id, :points, :event_id, :transaction_type_id, :comment
  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Brownie Point Transaction" do
      f.input :user_id, as: :select, collection: User.all.map{|u| [u.email, u.id]}
      f.input :event
      f.input :transaction_type
      f.input :points
      f.input :comment
    end
    f.actions
  end

  controller do
    def scoped_collection
      super.includes :user, :order, :event, :transaction_type
    end
  end

end
