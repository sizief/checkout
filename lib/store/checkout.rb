# frozen_string_literal: true

# Scan items, asking for discount price and returns total price.
class Checkout
  attr_reader :basket

  def initialize
    @basket = []
  end

  def scan(item)
    product = find_product item
    raise 'item not found' if product.nil?

    @basket << product
  end

  def total
    # product_list = basket.map(:&to_h)
    # total_without_discount - Discount.total(product_list)
  end

  private

  def find_product(item)
    Product.find_by(:code, item)
    # product = Repository.for(Product).find_by(:code, item)
  end

  def total_without_discount; end
end
