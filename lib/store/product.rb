# frozen_string_literal: true

require_relative 'repository'
require 'bigdecimal'

# Simple class for products we have
class Product
  extend Repository::Searchability

  attr_accessor :code, :name, :price
  def initialize(code:, name:, price:)
    @code = code
    @name = name
    @price = BigDecimal(price.to_s)
  end
end
