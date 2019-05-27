# frozen_string_literal: true

require 'test_helper'

class CustomerSearchable
  extend Repository::Searchability
  attr_accessor :name, :family
  def initialize(name, family)
    @name = name
    @family = family
  end
end

class SearchabilityTest < Minitest::Test
  def setup
    # Register our class to Repository
    Repository::Base.register CustomerSearchable
  end

  def test_roles
    assert CustomerSearchable.respond_to? :find_by
    assert CustomerSearchable.respond_to? :find
    assert CustomerSearchable.respond_to? :save
  end

  def test_find_and_find_by
    customer = CustomerSearchable.new('Ali', 'Deishidi')
    CustomerSearchable.save(customer)

    assert_equal CustomerSearchable.find(1), customer
    assert_equal CustomerSearchable.find_by(:name, 'Ali'), customer
    assert_nil CustomerSearchable.find_by(:name, 'nobody')
  end
end
