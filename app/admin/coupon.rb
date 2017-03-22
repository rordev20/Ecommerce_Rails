ActiveAdmin.register Coupon do

  permit_params :name, :limit, :start_date, :end_date, :code, :coupon_type, :percent_off, :flat_off, :minimum_amount,
                :discount_type, :use_count, :maximum_discount, :is_active, :deleted_at

    form do |f|
      f.inputs "Coupon" do
        f.input :name
        f.input :limit
        f.input :start_date
        f.input :end_date
        f.input :code
        f.input :coupon_type, collection: SystemConstant.get_value_in_array('coupon_type')
        f.input :percent_off
        f.input :flat_off
        f.input :minimum_amount
        f.input :discount_type, collection: SystemConstant.get_value_in_array('discount_type')
        f.input :use_count
        f.input :maximum_discount
      end
      f.actions
    end

end
