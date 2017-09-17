ActiveAdmin.register OrderItem do
  actions :all, :except => [:new]  
  menu parent: "Order Details", priority: 2
  config.filters = false
end
