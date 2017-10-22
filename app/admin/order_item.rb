ActiveAdmin.register OrderItem do
  actions :all, :except => [:new]  
  menu parent: "Order Details", priority: 2
  config.filters = false

  controller do
    def scoped_collection
      super.includes :order, :product, :cart_item
    end
  end
end
