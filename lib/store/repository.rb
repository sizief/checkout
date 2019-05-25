# frozen_string_literal: true

require_relative 'repository/item_repository'
# Repository to store state of objects. It would act like a Database.
# This class will store only ItemRepository Objects and can retrieves
# them with for method.
#
# For example:
#
#   Repository::Base.register (User, ItemRepository.new)
#
# and then we can retrieve this ItemRepository instance for saving User models:
#
#   Repository::Base.for(User).save(user_object)
#
# It can be replaced with ActiveRecord, however it has its own advantages like
# decoupling from DB technologies and also Single Responsibility.
#
module Repository
  class Base
    def self.register(klass, item_repository = ItemRepository.new)
      name = get_name klass
      registery[name] = item_repository
    end

    def self.registery
      @registery ||= {}
    end

    def self.for(klass)
      name = get_name klass
      @registery[name]
    end

    def self.get_name(klass)
      klass.name.to_sym
    end
  end
end
