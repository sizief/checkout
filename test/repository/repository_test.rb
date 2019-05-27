# frozen_string_literal: true

require 'test_helper'

class User end

class RepositoryTest < Minitest::Test
  def test_access_before_initialize
    assert_raises ::Repository::Errors::NotRegistered do
      Repository::Base.for(String)
    end
  end

  def test_register
    Repository::Base.register User, User.new
    assert Repository::Base.for(User).is_a? User
  end

  def test_not_registered
    Repository::Base.register User, User.new
    assert_raises ::Repository::Errors::NotRegistered do
      Repository::Base.for(String)
    end
  end
end
