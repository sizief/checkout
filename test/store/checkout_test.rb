# frozen_string_literal: true

require 'test_helper'
require_relative '../../seed'

class CheckoutTest < Minitest::Test
  # For sake of simplicity we have defined data once for test and prod.
  # In the future we can define test data too.
  def setup
    Store.configure do |config|
      config.products = './data/products.json'
      config.discounts = './data/discounts.json'
    end
    Seed.load
    @co = Checkout.new
  end

  def test_scan
    @co.scan('VOUCHER')
    assert_equal @co.list.first.code, 'VOUCHER'
  end

  def test_total
    @co.scan('VOUCHER')
    @co.scan('VOUCHER')
    @co.scan('VOUCHER')
    @co.scan('TSHIRT')
    @co.scan('TSHIRT')
    @co.scan('TSHIRT')
    @co.scan('MUG')
    assert_equal @co.total, 74.5
  end
end
