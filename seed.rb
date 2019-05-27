# frozen_string_literal: true

require_relative 'lib/store'
require 'json'
# Create and save necessary models
class Seed
  def self.load
    load_products
    load_discounts
  end

  def self.load_products(products = Store.configuration.products)
    Repository::Base.register Product
    file = File.read(products)
    products = JSON.parse(file)

    products['products'].each do |p|
      product = Product.new(code: p['code'], price: p['price'], name: p['name'])
      Product.save(product)
    end
  end

  def self.load_discounts(discounts = Store.configuration.discounts)
    Repository::Base.register Discount
    file = File.read(discounts)
    discounts = JSON.parse(file)

    discounts['discounts'].each do |d|
      symbolized_key_hash = Hash[d.map { |k, v| [k.to_sym, v] }]
      discount = Discount.factory d['type'], symbolized_key_hash
      Discount.save(discount)
    end
  end
end
