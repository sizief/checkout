# frozen_string_literal: true

require 'test_helper'

class User end

class RepositoryTest < Minitest::Test
  def test_register
    Repository::Base.register User, User.new
    assert Repository::Base.for(User).is_a? User
  end
end
