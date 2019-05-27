# frozen_string_literal: true

require_relative 'repository'
require_relative 'discount/base'
require_relative 'discount/free'
require_relative 'discount/percentage_for_more_than'

##
# Calculate and create several types of discounts
# Every class of this module would expect to receive
# this set of parameters:
#
#   - For initialize:
#     discount specific parameters (:tagret_item for example)
#   - To calculate discount, by calling `total` and with the following argument
#     Array of hashes that represent list of products.
#
#     This hash should contains `code` and `price`.
#
#     For example:
#
#     [{code: 'VOUCHER', price: 10}, {code: 'MUG', price: 20}]
#
# This way Discount is not coupled to product model.
##
module Discount
  extend Repository::Searchability

  # Get all stored discound types and calculate total discount
  # by calling `total` on each discount and return sum of all discount amounts.
  def self.total(items, discount_list = get_discount_list)
    total_discount = 0
    discount_list.each do |discount|
      total_discount += discount.total items
    end
    total_discount
  end

  # Create discount object for defined classes
  def self.factory(type, args)
    case type
    when 'free'
      Discount::Free.new args
    when 'percentage_for_more_than'
      Discount::PercentageForMoreThan.new args
    else
      raise "#{discount} is not defined in system"
    end
  end

  def self.get_discount_list
    Repository::Base.for(Discount).all
  end
end
