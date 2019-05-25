# frozen_string_literal: true

require_relative 'store/product'
require_relative 'store/discount'
require_relative 'store/checkout'
require_relative 'store/repository'

require_relative 'store/configuration'

require_relative 'store/error/repository/attribute_error'

module Store
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
