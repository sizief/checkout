require_relative 'lib/store'
require 'json'

# Create and save necessary models 
class Seed

  def self.load
    load_products 
    load_discounts
  end
    
  def self.load_products products = Store.configuration.products
    Repository::Base.register Product
    file = File.read(products)
    products = JSON.parse(file)

    products['products'].each do |p|
      product = Product.new(code: p['code'], price: p['price'], name: p['name'])
      Repository::Base.for(Product).save(product)
    end
  end
  
  def self.load_discounts discounts = Store.configuration.discounts
    Repository::Base.register Discount
    file = File.read(discounts)
    discounts = JSON.parse(file)

    discounts['discounts'].each do |d|
      discount = Discount.factory d['type'], to_hash(d)
      Repository::Base.for(Discount).save(d)
    end
  end

  def self.to_hash params
    
  end
end
