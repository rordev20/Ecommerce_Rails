ActiveAdmin.register Product do

  permit_params :name, :dimension, :description, :price, :vendor, :sub_category, :quantity, :color, :domestic_pos, :international_pos, :specification, :product_code,
                :weight, :sell_count, :notes, :clicks, :discount_percent, :active, :discount_amount, :in_stock, :is_active, :deleted_at

end
