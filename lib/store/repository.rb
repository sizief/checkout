# frozen_string_literal: true

require_relative 'repository/item_repository'
require_relative 'repository/searchability'
require_relative 'repository/errors'

module Repository
  ##
  # Repository to store state of objects. It would act like a Database.
  # This class will store only ItemRepository Objects and can retrieves
  # them with for method.
  #
  # For example:
  #
  #   Repository::Base.register (User, ItemRepository.new)
  #
  # and then we can retrieve this ItemRepository instance to save User models:
  #
  #   Repository::Base.for(User).save(user_object)
  #
  # Also you can extending Repository::Searchability to any class.
  # After that you can have `find`, `find_by` and `save` on that class.
  # F
  # or example:
  #
  #   User.save(user)
  #   User.find(1)
  #   User.find_by(:name, 'ali')
  #
  # It can be replaced with ActiveRecord, however it has its own advantages like
  # decoupling from DB technologies and also Single Responsibility.
  ##
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
      if @registery.nil? || @registery[name].nil?
        raise Repository::Errors::NotRegistered, name
      end

      @registery[name]
    end

    def self.get_name(klass)
      klass.name.to_sym
    end
    private_class_method :get_name
  end
end
