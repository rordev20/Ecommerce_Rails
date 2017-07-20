ActiveAdmin.register Banner do

  permit_params :name, :description, :image, :start_date_date, :start_date_time_hour, :start_date_time_minute, :end_date_date, :end_date_time_hour, :end_date_time_minute, :target_url, :in_new_tab, :position, :is_active, :deleted_at,
                device_type_ids: [], country_ids: []

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs "Banner" do
      f.input :device_types, as: :check_boxes
      f.input :name
      f.input :description
      f.input :image, as: :file
      f.input :start_date, as: :just_datetime_picker
      f.input :end_date, as: :just_datetime_picker
      f.input :target_url
      f.input :in_new_tab
      f.input :position
      f.input :countries, as: :check_boxes
      f.input :is_active
      f.input :deleted_at
    end
    f.actions
  end
end
