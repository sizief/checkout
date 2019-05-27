# frozen_string_literal: true

module Repository
  module Errors
    # Error class for calling Reositpry without regstering anything first
    class NotRegistered < StandardError
      def initialize(name)
        message = "#{name} + is not registered. "
        message += 'Please register it first, See Repositoy docs for more info.'
        super(message)
      end
    end
  end
end
