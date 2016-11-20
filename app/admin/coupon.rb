ActiveAdmin.register Coupon do

  permit_params :name, :limit, :start_date, :end_date, :code, :coupon_type, :percent_off, :flat_off, :minimum_amount,
                :discount_type, :use_count, :maximum_discount, :is_active, :deleted_at

end
