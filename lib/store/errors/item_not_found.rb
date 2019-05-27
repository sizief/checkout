# frozen_string_literal: true

module Errors
  # Error class for not found products
  class ItemNotFound < StandardError
    def initialize(name)
      message = "#{name} is not defined in system "
      super(message)
    end
  end
end
