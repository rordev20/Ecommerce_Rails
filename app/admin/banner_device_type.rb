ActiveAdmin.register BannerDeviceType do
  menu parent: "Banner", priority: 3

  permit_params :banner_id, :device_type_id

end
