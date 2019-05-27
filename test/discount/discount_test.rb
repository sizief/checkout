# frozen_string_literal: true

require 'test_helper'

class DiscountTest < Minitest::Test
  def setup
    @products = [
      { code: 'VOUCHER', price: '5' },
      { code: 'VOUCHER', price: '5' },
      { code: 'VOUCHER', price: '5' },
      { code: 'TSHIRT', price: '20' },
      { code: 'TSHIRT', price: '20' },
      { code: 'TSHIRT', price: '20' }
    ]
    @dc_type_one = Discount::Free.new(target_item: 'VOUCHER',
                                      extra_number: 1,
                                      threshold_number: 2)
    @dc_type_two = Discount::PercentageForMoreThan.new(target_item: 'TSHIRT',
                                                       percentage: '0.05',
                                                       threshold_number: 3)
  end

  def test_total
    assert_equal Discount.total(@products, [@dc_type_one, @dc_type_two]), 8
  end
end
