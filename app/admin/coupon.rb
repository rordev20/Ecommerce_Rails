ActiveAdmin.register Coupon do

  permit_params :name, :limit, :start_date_date, :start_date_time_hour, :start_date_time_minute, :end_date_date, :end_date_time_hour, :end_date_time_minute, :code, :coupon_type_id, :percent_off, :flat_off, :minimum_amount,
                :discount_type_id, :use_count, :maximum_discount, :is_cashback, :app_only, :only_for_new_user, :discount_with_cashback_offer, :products_specific, :product_ids, :is_active, :deleted_at

    form do |f|
      f.inputs "Coupon" do
        f.input :name
        f.input :code
        f.input :start_date, :as => :just_datetime_picker
        f.input :end_date, :as => :just_datetime_picker
        f.input :coupon_type
        f.input :discount_type
        f.input :percent_off
        f.input :flat_off
        f.input :minimum_amount
        f.input :limit
        f.input :use_count
        f.input :maximum_discount
        f.input :maximum_discount
        f.input :is_cashback
        f.input :app_only
        f.input :only_for_new_user
        f.input :discount_with_cashback_offer
        f.input :products_specific
        f.input :product_ids
        f.input :is_active
      end
      f.actions
    end

end
