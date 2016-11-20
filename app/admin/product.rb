ActiveAdmin.register Product do

  permit_params :name, :dimension, :description, :price, :vendor, :sub_category, :quantity, :color, :domestic_pos, :international_pos, :specification, :product_code,
                :weight, :sell_count, :notes, :clicks, :discount_percent, :discount_amount, :in_stock, :is_active, :deleted_at



  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
	    f.input :name
	    f.input :dimension
	    f.input :description
	    f.input :price
	    f.input :sub_category
	    f.input :quantity
	    f.input :color
	    f.input :domestic_pos
	    f.input :international_pos
	    f.input :specification
	    f.input :product_code
	    f.input :weight
	    f.input :sell_count
	    f.input :notes
	    f.input :clicks
	    f.input :discount_percent
	    f.input :discount_amount
      f.input :in_stock
      f.input :is_active
      f.input :deleted_at
    end
    f.actions
  end

end
