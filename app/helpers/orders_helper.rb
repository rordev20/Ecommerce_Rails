module OrdersHelper

  # This method build user shipping address
  def shipping_address(order)
    content_tag(:address) do
      content_tag(:strong, "Shipping Address:") + tag(:br) +
      order.shipping_address.address1 + order.shipping_address.address2 + tag(:br) +
      order.shipping_address.phone + tag(:br) +
      order.shipping_address.zipcode + ', ' + order.shipping_address.state.name + ', ' + order.shipping_address.country.name
    end
  end
end
