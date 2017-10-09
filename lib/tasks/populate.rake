# task to run
#rake db:create db:migrate db:seed populate_data:populate_dummy_data populate_data:create_system_constant
namespace :populate_data do
  desc "Dummy data"
  task :populate_dummy_data => :environment do
    Vendor.create!(name: 'Rohit', email: 'xyz@gmail.com')
    Color.create!(name: 'red', code: '#FF0000', is_active: true)
    Color.create!(name: 'yellow', code: '#FFFF00', is_active: true)
    Color.create!(name: 'green', code: '#00FF00', is_active: true)
    Color.create!(name: 'blue', code: '#0000FF', is_active: true)
    Category.create!(name: 'sarees', description: 'sarees collection', is_active: true)
    Category.create!(name: 'shoes', description: 'shoes collection', is_active: true)
    SubCategory.create!(category: Category.first, name: 'saree sub_category', description: 'saree sub_category description', is_active: true)
    SubCategory.create!(category: Category.last, name: 'Shoe sub_category', description: 'Shoe sub_category description', is_active: true)
    Product.create!(name: 'saree one', dimension: '1x2', description: 'saree one description', sell_price: 90, purchase_price: 100, sub_category: SubCategory.first, is_active: true, color: Color.last, domestic_pos: 1, international_pos: 1, product_code: 'xyz', quantity: 10, vendor: Vendor.first)
    Product.create!(name: 'saree two', dimension: '1x2', description: 'saree two description', sell_price: 200, purchase_price: 100, sub_category: SubCategory.first, is_active: true, color: Color.first, domestic_pos: 1, international_pos: 1, product_code: 'abc', quantity: 10, vendor: Vendor.first)
    Product.create!(name: 'shoe one', dimension: '1x2', description: 'shoe one description', sell_price: 300, purchase_price: 100, sub_category: SubCategory.last, is_active: true, color: Color.last, domestic_pos: 1, international_pos: 1, product_code: 'efg', quantity: 10, vendor: Vendor.first)
    Product.create!(name: 'shoe two', dimension: '1x2', description: 'shoe two description', sell_price: 400, purchase_price: 100, sub_category: SubCategory.last, is_active: true, color: Color.last, domestic_pos: 1, international_pos: 1, product_code: 'klm', quantity: 10, vendor: Vendor.first)
    Country.create!(name: 'India', is_active: true)
    Country.create!(name: 'Usa', is_active: true)
    State.create!(name: 'Up', is_active: true, country: Country.last)
    State.create!(name: 'Maharashtra', is_active: true, country: Country.last)
    State.create!(name: 'Newyork', is_active: true, country: Country.first)
    State.create!(name: 'Washington', is_active: true, country: Country.first)
    PaymentMethod.create!(name: 'Cod', is_active: true)
    PaymentMethod.create!(name: 'Bank Deposit', is_active: true)
    DiscountType.create!(name: 'flat', is_active: true)
    DiscountType.create!(name: 'percentage', is_active: true)
    CouponType.create!(name: 'first order discount', is_active: true)
    CouponType.create!(name: 'other', is_active: true)
    CouponType.create!(name: 'user specific coupon', is_active: true)
    Coupon.create!(name: 'flat10', limit: 15, start_date: Date.today, end_date: Date.today+30, code: 'flat10', coupon_type: CouponType.first, flat_off: 10, discount_type: DiscountType.first)
    Coupon.create!(name: 'flat25', limit: 15, start_date: Date.today, end_date: Date.today+30, code: 'flat25', coupon_type: CouponType.last, flat_off: 25, discount_type: DiscountType.first)
    Coupon.create!(name: 'percentage10', limit: 15, start_date: Date.today, end_date: Date.today+30, code: 'percentage10', coupon_type: CouponType.first, percent_off: 10, discount_type: DiscountType.last)
    Coupon.create!(name: 'percentage30', limit: 15, start_date: Date.today, end_date: Date.today+30, code: 'percentage30', coupon_type: CouponType.last, percent_off: 30, discount_type: DiscountType.last)
    AddressType.where(name: 'billing_address').first_or_create
    AddressType.where(name: 'shipping_address').first_or_create
    Event.create!(name: 'order_placed', is_active: true)
    Event.create!(name: 'by_admin', is_active: true)
    TransactionType.create!(name: 'Debit', is_active: true)
    TransactionType.create!(name: 'Credit', is_active: true)
    DeviceType.create!(name: 'ios', is_active: true)
    DeviceType.create!(name: 'android', is_active: true)
    DeviceType.create!(name: 'web', is_active: true)
  end

  desc "system constant"
  task :create_system_constant => :environment do
    constant_array = []
    constant_array.each do |constant|
      system_constant = SystemConstant.where(name: constant[:name]).first_or_initialize
      system_constant.value = constant[:value]
      system_constant.save!
    end
  end
end
