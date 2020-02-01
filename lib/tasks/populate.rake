# task to run
#rake db:create db:migrate db:seed populate_data:populate_dummy_data populate_data:create_system_constant
namespace :populate_data do
  desc "Dummy data"
  task :populate_dummy_data => :environment do
    puts "=================vendor start====================="
    Vendor.create!(name: 'Rohit', email: 'xyz1@gmail.com')
    puts "=================vendor done====================="

    puts "=================color start====================="
    Color.create!(name: 'red', code: '#FF0000', is_active: true)
    Color.create!(name: 'yellow', code: '#FFFF00', is_active: true)
    Color.create!(name: 'green', code: '#00FF00', is_active: true)
    Color.create!(name: 'blue', code: '#0000FF', is_active: true)
    puts "=================color done====================="

    puts "=================category start====================="
    Category.create!(name: 'sarees', description: 'sarees collection', is_active: true)
    Category.create!(name: 'shoes', description: 'shoes collection', is_active: true)
    puts "=================category done====================="

    puts "=================subcategory start====================="
    SubCategory.create!(category: Category.first, name: 'saree sub_category', description: 'saree sub_category description', is_active: true)
    SubCategory.create!(category: Category.last, name: 'Shoe sub_category', description: 'Shoe sub_category description', is_active: true)
    puts "=================subcategory end====================="

    puts "=================product start====================="
    Product.create!(name: 'saree one', dimension: '1x2', description: 'saree one description', original_price: 90, purchase_price: 100, sell_price: 100, sub_category: SubCategory.first, is_active: true, color: Color.last, domestic_pos: 1, international_pos: 1, product_code: 'xyz', quantity: 10, vendor: Vendor.first)
    Product.create!(name: 'saree two', dimension: '1x2', description: 'saree two description', original_price: 200, purchase_price: 100, sell_price: 500, sub_category: SubCategory.first, is_active: true, color: Color.first, domestic_pos: 1, international_pos: 1, product_code: 'abc', quantity: 10, vendor: Vendor.first)
    Product.create!(name: 'shoe one', dimension: '1x2', description: 'shoe one description', original_price: 300, purchase_price: 100, sell_price: 600, sub_category: SubCategory.last, is_active: true, color: Color.last, domestic_pos: 1, international_pos: 1, product_code: 'efg', quantity: 10, vendor: Vendor.first)
    Product.create!(name: 'shoe two', dimension: '1x2', description: 'shoe two description', original_price: 400, purchase_price: 100, sell_price: 300, sub_category: SubCategory.last, is_active: true, color: Color.last, domestic_pos: 1, international_pos: 1, product_code: 'klm', quantity: 10, vendor: Vendor.first)
    puts "=================product done====================="

    puts "=================country start====================="
    Country.create!(name: 'India', iso_code: 'IN', iso_name: 'INR', is_active: true)
    Country.create!(name: 'Usa', iso_code: 'US', iso_name: 'USD', is_active: true)
    puts "=================country done====================="

    puts "=================state start====================="
    State.create!(name: 'Up', is_active: true, country: Country.last)
    State.create!(name: 'Maharashtra', is_active: true, country: Country.last)
    State.create!(name: 'Newyork', is_active: true, country: Country.first)
    State.create!(name: 'Washington', is_active: true, country: Country.first)
    puts "=================state done====================="

    puts "=================payment start====================="
    PaymentMethod.create!(name: 'Cod', payment_mode: 'cod', is_active: true)
    PaymentMethod.create!(name: 'Bank Deposit', payment_mode: 'online', is_active: true)
    puts "=================payment done====================="

    puts "=================discount type start====================="
    DiscountType.create!(name: 'flat', is_active: true)
    DiscountType.create!(name: 'percentage', is_active: true)
    puts "=================discount type done====================="

    puts "=================coupon type start====================="
    CouponType.create!(name: 'first order discount', is_active: true)
    CouponType.create!(name: 'other', is_active: true)
    CouponType.create!(name: 'user specific coupon', is_active: true)
    puts "=================coupon type done====================="

    puts "=================coupon start====================="
    Coupon.create!(name: 'flat10', limit: 15, start_date: Date.today, end_date: Date.today+30, code: 'flat10', coupon_type: CouponType.first, flat_off: 10, discount_type: DiscountType.first)
    Coupon.create!(name: 'flat25', limit: 15, start_date: Date.today, end_date: Date.today+30, code: 'flat25', coupon_type: CouponType.last, flat_off: 25, discount_type: DiscountType.first)
    Coupon.create!(name: 'percentage10', limit: 15, start_date: Date.today, end_date: Date.today+30, code: 'percentage10', coupon_type: CouponType.first, percent_off: 10, discount_type: DiscountType.last)
    Coupon.create!(name: 'percentage30', limit: 15, start_date: Date.today, end_date: Date.today+30, code: 'percentage30', coupon_type: CouponType.last, percent_off: 30, discount_type: DiscountType.last)
    puts "=================coupon done====================="

    puts "=================address type start====================="
    AddressType.where(name: 'billing_address').first_or_create
    AddressType.where(name: 'shipping_address').first_or_create
    puts "=================address type done====================="

    puts "=================event start====================="
    Event.create!(name: 'order_placed', is_active: true)
    Event.create!(name: 'by_admin', is_active: true)
    puts "=================event done====================="

    puts "=================transaction type start====================="
    TransactionType.create!(name: 'Debit', is_active: true)
    TransactionType.create!(name: 'Credit', is_active: true)
    puts "=================transaction type done====================="

    puts "=================device type start====================="
    DeviceType.create!(name: 'ios', is_active: true)
    DeviceType.create!(name: 'android', is_active: true)
    DeviceType.create!(name: 'web', is_active: true)
    puts "=================device type done====================="
  end

  desc "system constant"
  task :create_system_constant => :environment do
    constant_array = []
    constant_array << {name: 'default_country', value: 'INR' }
    constant_array << {name: 'default_conversion_rate', value: 1 }
    constant_array.each do |constant|
      system_constant = SystemConstant.where(name: constant[:name]).first_or_initialize
      system_constant.value = constant[:value]
      system_constant.save!
    end
  end
end
