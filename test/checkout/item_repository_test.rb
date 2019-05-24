# frozen_string_literal: true

require 'test_helper'

class Customer
  attr_accessor :name, :family
  def initialize(name, family)
    @name = name
    @family = family
  end
end

class ItemRepositoryTest < Minitest::Test
  def setup
    # Register our model to Repository
    Repository.register :customer, ItemRepository.new
  end

  def test_save_and_find
    # Save one object to our user repository
    Repository.for(:customer).save(Customer.new('Ali', 'Deishidi'))
    assert_equal Repository.for(:customer).find(1).family, 'Deishidi'
  end

  def test_find_by
    Repository.for(:customer).save(Customer.new('Ali', 'Deishidi'))

    assert_equal Repository.for(:customer).find_by(:name, 'Ali')
                           .first.family, 'Deishidi'

    assert_equal Repository.for(:customer).find_by(:name, 'Not found'), []

    assert_raises do
      Repository.for(:customer).find_by(:not_found_attribue, '')
    end
  end
end
