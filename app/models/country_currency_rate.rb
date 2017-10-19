class CountryCurrencyRate
  attr_accessor :currency_rate, :currency_code

  def initialize(options = nil)
    @currency_rate = options[:currency_rate]
    @currency_code = options[:currency_code]
  end
end