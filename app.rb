# frozen_string_literal: true

require_relative 'lib/store'
require_relative 'seed'

# Setup products registery
Store.configure do |config|
  config.products = './data/products.json'
  config.products = './data/discounts.json'
end

p Store.configuration.products
Seed.load

p Repository::Base.for(Product).find(1)
p Repository::Base.for(Product).find(2)
p Repository::Base.for(Product).find(3)
