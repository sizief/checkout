# frozen_string_literal: true

require 'test_helper'
require_relative 'roles_test_helper'

class DiscountFreeTest < Minitest::Test
  include RolesTestHelper

  def setup
    @products = [
      { code: 'VOUCHER', price: '10' },
      { code: 'VOUCHER', price: '10' },
      { code: 'MUG', price: '10' },
      { code: 'MUG', price: '10' },
      { code: 'SOMETHING', price: '10' },
      { code: 'VOUCHER', price: '10' },
      { code: 'VOUCHER', price: '10' }
    ]
    @args = { target_item: 'VOUCHER', extra_number: 1, threshold_number: 2 }
    @free_dc = @object = Discount::Free.new @args
  end

  def test_total
    assert_equal @free_dc.total(@products[0..5]), 10
    assert_equal @free_dc.total(@products[0..6]), 20
    assert_equal @free_dc.total(@products[2..5]), 0
  end

  def test_with_extra_number
    @args[:extra_number] = 2
    assert_equal Discount::Free.new(@args).total(@products[0..6]), 40
  end
end
