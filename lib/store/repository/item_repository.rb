# frozen_string_literal: true

module Repository
  ##
  # A repository for each type of classes.
  # Think of this as a table in relational databases.
  # For this project this would be enough, but in the future we can have
  # separated classes for each model (ProductRepository for example)
  # Usage example
  #     Repository::Base.for(Product).find(1)
  # Or
  #     Repository::Base.for(Product).find_by(:code, 'VOUCHER')
  ##
  class ItemRepository
    def initialize
      @rows = {}
      @id = 1
    end

    def save(object)
      @rows[@id] = object
      @id += 1
    end

    # returns A product object
    def find(id)
      @rows[id]
    end

    # returns A product object that matches the criteria
    # or Nil if there isn't one.
    def find_by(attribute, value)
      unless @rows[1].respond_to? attribute
        raise Repository::Errors::AttributeNotFound, attribute
      end

      @rows.select do |_id, object|
        object.instance_variable_get("@#{attribute}") == value
      end.values.first
    end

    def all
      @rows.values
    end
  end
end
