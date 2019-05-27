# frozen_string_literal: true

module Repository
  module Errors
    # Error class for Repository models
    class AttributeNotFound < StandardError
      def initialize(attribute)
        message = "#{attribute} is not defined for this class. "
        message += 'Check class definition.'
        super(message)
      end
    end
  end
end
