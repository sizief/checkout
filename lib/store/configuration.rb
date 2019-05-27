# frozen_string_literal: true

module Store
  # Application configuration for App
  class Configuration
    attr_accessor :products, :discounts
    def initialize
      @products = nil
      @discounts = nil
    end
  end
end
