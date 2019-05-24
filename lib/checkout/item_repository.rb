# frozen_string_literal: true

# A repository for each type of classes.
# Think of this as a table in relational databases.
# For this project this would be enough, but in the future we can have
# separated classes for each model (ProductRepository for example)
class ItemRepository
  def initialize
    @rows = {}
    @id = 1
  end

  def save(object)
    @rows[@id] = object
  end

  def find(id)
    @rows[id]
  end

  def find_by(attribute, value)
    raise Errors::Repository::AttributeError, attribute unless @rows[1].respond_to? attribute

    @rows.select do |_id, object|
      object.instance_variable_get("@#{attribute}") == value
    end.values
  end
end
