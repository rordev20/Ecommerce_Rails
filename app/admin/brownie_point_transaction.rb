ActiveAdmin.register BrowniePointTransaction do
  
  permit_params :user_id, :points, :event_id, :transaction_type_id, :comment
	form do |f|
	  f.inputs "Brownie Point Transaction" do
	    f.input :user_id, as: :select, collection: User.all.map{|u| [u.email, u.id]}
	    f.input :event
	    f.input :transaction_type
	    f.input :points
	    f.input :comment
	  end
	  f.actions
	end  
end
