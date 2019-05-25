# frozen_string_literal: true

require 'test_helper'

class ProductTest < Minitest::Test
  def setup
    @product = Product.new(code: 'VOUCHER', name: 'Voucher ', price: 10.50)
  end

  def test_price
    assert_equal @product.price, 10.5
  end
end
