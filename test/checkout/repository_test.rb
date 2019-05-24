# frozen_string_literal: true

require 'test_helper'

class User end

class RepositoryTest < Minitest::Test
  def test_register
    Repository.register :user, User.new
    assert Repository.for(:user).is_a? User
  end
end
