# task to run
#rake db:create db:migrate db:seed populate_data:populate_dummy_data populate_data:create_system_constant
namespace :populate_data do
  desc "Dummy data"
  task :populate_dummy_data => :environment do
    Category.create!(name: 'sarees', description: 'sarees collection')
    Category.create!(name: 'shoes', description: 'shoes collection')
    SubCategory.create!(category: Category.first, name: 'saree wollen one', description: 'saree wollen fashion one')
    SubCategory.create!(category: Category.first, name: 'saree wollen two', description: 'saree wollen fashion two')
    SubCategory.create!(category: Category.first, name: 'saree wollen three', description: 'saree wollen fashion three')
    SubCategory.create!(category: Category.first, name: 'saree wollen four', description: 'saree wollen fashion four')
    SubCategory.create!(category: Category.first, name: 'saree wollen five', description: 'saree wollen fashion five')
    SubCategory.create!(category: Category.first, name: 'saree wollen six', description: 'saree wollen fashion six')
    SubCategory.create!(category: Category.last, name: 'saree wollen one two', description: 'saree wollen fashion one two')
    SubCategory.create!(category: Category.last, name: 'saree wollen two two', description: 'saree wollen fashion two two')
    SubCategory.create!(category: Category.last, name: 'saree wollen three two', description: 'saree wollen fashion three two')
    SubCategory.create!(category: Category.last, name: 'saree wollen four two', description: 'saree wollen fashion four two')
    SubCategory.create!(category: Category.last, name: 'saree wollen five two', description: 'saree wollen fashion five two')
    SubCategory.create!(category: Category.last, name: 'saree wollen six two', description: 'saree wollen fashion six two')
    Product.create!(name: 'saree one', dimension: '1x2', description: 'saree one description', sell_price: 90, purchase_price: 100, sub_category: SubCategory.first, is_active: true)
    Product.create!(name: 'saree two', dimension: '1x2', description: 'saree two description', sell_price: 200, purchase_price: 100, sub_category: SubCategory.first, is_active: true)
    Product.create!(name: 'saree three', dimension: '1x2', description: 'saree three description', sell_price: 300, purchase_price: 100, sub_category: SubCategory.first, is_active: true)
    Product.create!(name: 'saree four', dimension: '1x2', description: 'saree four description', sell_price: 400, purchase_price: 100, sub_category: SubCategory.first, is_active: true)
    Product.create!(name: 'saree five', dimension: '1x2', description: 'saree five description', sell_price: 500, purchase_price: 100, sub_category: SubCategory.first, is_active: true)
    Product.create!(name: 'saree six', dimension: '1x2', description: 'saree six description', sell_price: 150, purchase_price: 100, sub_category: SubCategory.first, is_active: true)
    Product.create!(name: 'saree seven', dimension: '1x2', description: 'saree seven description', sell_price: 240, purchase_price: 100, sub_category: SubCategory.last, is_active: true)
    Product.create!(name: 'saree eight', dimension: '1x2', description: 'saree eight description', sell_price: 700, purchase_price: 100, sub_category: SubCategory.last, is_active: true)
    Product.create!(name: 'saree nine', dimension: '1x2', description: 'saree nine description', sell_price: 500, purchase_price: 100, sub_category: SubCategory.last, is_active: true)
    Product.create!(name: 'saree ten', dimension: '1x2', description: 'saree ten description', sell_price: 300, purchase_price: 100, sub_category: SubCategory.last, is_active: true)
    Product.create!(name: 'saree eleven', dimension: '1x2', description: 'saree eleven description', sell_price: 200, purchase_price: 100, sub_category: SubCategory.last, is_active: true)
    Product.create!(name: 'saree twele', dimension: '1x2', description: 'saree twele description', sell_price: 90, purchase_price: 100, sub_category: SubCategory.last, is_active: true)
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
    Color.create!(name: 'red', code: '#FF0000', is_active: true)
    Color.create!(name: 'yellow', code: '#FFFF00', is_active: true)
    Color.create!(name: 'green', code: '#00FF00', is_active: true)
    Color.create!(name: 'blue', code: '#0000FF', is_active: true)
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
