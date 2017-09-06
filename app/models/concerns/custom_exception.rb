module CustomException
  extend ActiveSupport::Concern
  class InsufficientInventory < StandardError
    def initialize(product=nil)
      @product = product
    end

    def message
      I18n.t('custom_exception.insufficient_inventory', product_name: @product.name)
    end
  end

  class SizeMissing < StandardError
    def message
      I18n.t('custom_exception.size_missing')
    end
  end
end