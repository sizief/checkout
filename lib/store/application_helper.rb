# frozen_string_literal: true

# All helper mehtods for App would go here
module ApplicationHelper
  def convert_to_hash(object)
    obj_hash = {}
    object.instance_variables.each do |var|
      obj_hash[var.to_s.delete('@').to_sym] = object.instance_variable_get(var)
    end
    obj_hash
  end
end
