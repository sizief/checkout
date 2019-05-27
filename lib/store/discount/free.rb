# frozen_string_literal: true

require 'bigdecimal'

module Discount
  # #
  # Buy `treshold_number` of `target_item` and get `extra_number` of that item
  # as Free discount.
  # #
  class Free < Base
    attr_reader :target_item, :extra_number, :threshold_number

    def initialize(args)
      define_parameters args
    end

    def total(products)
      return 0 unless applicable?(products)

      items = target_items(products)
      (items.size / 2 * BigDecimal(items.first[:price])) * @extra_number
    end

    private

    def target_items(products)
      products.select { |product| product[:code] == @target_item }
    end

    def applicable?(products)
      target_items(products).size >= @threshold_number
    end

    def define_parameters(args)
      # TODO: add validation for parameters
      @target_item = args[:target_item]
      @extra_number = args[:extra_number]
      @threshold_number = args[:threshold_number]
    end
  end
end
