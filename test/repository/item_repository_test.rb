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
    # Register our class to Repository
    Repository::Base.register Customer
  end

  def test_save_and_find
    # Save one object to our user repository
    Repository::Base.for(Customer).save(Customer.new('Ali', 'Deishidi'))
    assert_equal Repository::Base.for(Customer).find(1).family, 'Deishidi'
    assert_nil Repository::Base.for(Customer).find(100)
  end

  def test_find_by
    Repository::Base.for(Customer).save(Customer.new('Ali', 'Deishidi'))
    assert_equal Repository::Base.for(Customer).find_by(:name, 'Ali')
                                 .family, 'Deishidi'
    assert_nil Repository::Base.for(Customer).find_by(:name, 'Not found')

    assert_raises ::Repository::Errors::AttributeNotFound do
      assert Repository::Base.for(Customer).find_by(:not_found_attribue, '')
    end
  end

  def test_all
    c1 = Customer.new('Ali', 'Deishidi')
    c2 = Customer.new('John', 'Do')
    Repository::Base.for(Customer).save c1
    Repository::Base.for(Customer).save c2
    assert_equal Repository::Base.for(Customer).all, [c1, c2]
  end
end
