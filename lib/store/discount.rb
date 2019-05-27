# frozen_string_literal: true

require_relative 'discount/free'
require_relative 'discount/percentage_for_more_than'

module Discount
  # Calculate and create several types of discounts

  def self.total(items)
    total_discount = 0
    discount_list.each do |discount|
      total_discount += discount.apply items
    end
    total_discount
  end

  def self.discount_list
    Repository::Base.for(Discount).all
  end

  def self.factory(type, args)
    case type
    when 'free'
      Discount::Free.new args
    when 'percentage_for_more_than'
      Discount::PercentageForMoreThan.new args
    else
      raise '#{discount} is not defined in system'
    end
  end
end
