# frozen_string_literal: true

require 'bigdecimal'
# Simple class for products we have
class Product
  attr_accessor :code, :name, :price
  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = BigDecimal(price.to_s)
  end
end
