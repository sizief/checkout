# frozen_string_literal: true

module Repository
  # Extend this module and class wil be able to find it's objects
  # We can extend ItemRepository itself, but having an extra layer of
  # abstraction would be more safer in case of changes in Repository itself.
  module Searchability
    def find(id)
      Repository::Base.for(self).find id
    end

    def find_by(attr, value)
      Repository::Base.for(self).find_by attr, value
    end

    def save(object)
      Repository::Base.for(self).save object
    end

    def all
      Repository::Base.for(self).all
    end
  end
end
