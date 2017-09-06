module ProductsHelper

  def show_checked_filter(filter_item_ids, filter_item)
    filter_item_ids.present? ? filter_item_ids.include?(filter_item.id.to_s) : false
  end

  def has_sizes?(product_sizes)
    product_sizes.count > 0
  end
end
