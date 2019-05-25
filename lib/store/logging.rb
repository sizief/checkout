# frozen_string_literal: true

require 'logger'
# Include this module to activate `logger` usage
module Logging
  def logger
    Logging.logger
  end

  def self.logger
    @logger ||= Logger.new(STDOUT)
  end
end
