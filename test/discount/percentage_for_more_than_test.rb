# frozen_string_literal: true

require 'test_helper'
require_relative 'roles_test_helper'

class DiscountPerentageForMoreThanTest < Minitest::Test
  include RolesTestHelper

  def setup
    @products = [
      { code: 'TSHIRT', price: '20' },
      { code: 'TSHIRT', price: '20' },
      { code: 'TSHIRT', price: '20' },
      { code: 'TSHIRT', price: '20' },
      { code: 'SOMETHING', price: '10' },
      { code: 'VOUCHER', price: '10' }
    ]
    @args = { target_item: 'TSHIRT', percentage: '0.05', threshold_number: 3 }
    @percentage_dc = @object = Discount::PercentageForMoreThan.new @args
  end

  def test_total
    assert_equal @percentage_dc.total(@products[0..1]), 0
    assert_equal @percentage_dc.total(@products[0..2]), 3
    assert_equal @percentage_dc.total(@products[0..-1]), 4
  end
end
