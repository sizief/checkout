# frozen_string_literal: true

module Errors
  module Repository
    # Error class for Repository models
    class AttributeError < StandardError
      def initialize(attribute)
        super("#{attribute} is not defined for this model")
      end
    end
  end
end
