module CartItemsHelper
  def append_class_with_id(klass, id)
    klass + id.to_s
  end

  def quantity_changed?(params)
    params["cart"].present? && ["added", "decreased"].include?(params["cart"])
  end
end
