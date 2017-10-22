ActiveAdmin.register BannerCountry do
  menu parent: "Banner", priority: 2

  permit_params :banner_id, :country_id

end
