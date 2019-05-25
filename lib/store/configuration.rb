# frozen_string_literal: true

module Store
  class Configuration
    attr_accessor :products, :discounts
    def initialize
      @products = nil
      @discounts = nil
    end
  end
end
