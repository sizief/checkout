# frozen_string_literal: true

require_relative 'application_helper'
require_relative 'logging'

# Scan items, asking for discount price and returns total price.
class Checkout
  include ApplicationHelper
  include Logging

  def initialize
    @products = []
  end

  def list
    @products
  end

  def scan(item)
    product = find_product item
    raise Errors::ItemNotFound, item if product.nil?

    @products << product
    logger.info "#{product} added to basket"
  rescue StandardError => e
    logger.warn e
  end

  def total
    # Since Discount does not (and should not) know about the internals of
    # Product object, we convert each product to hash and then send it to
    # discount.
    product_list_raw = @products.map { |product| convert_to_hash(product) }
    (total_without_discount - Discount.total(product_list_raw)).to_f
  end

  private

  def find_product(item)
    Product.find_by(:code, item)
  end

  def total_without_discount
    @products.map(&:price).reduce(:+)
  end
end
