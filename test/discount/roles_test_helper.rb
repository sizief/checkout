# frozen_string_literal: true

module RolesTestHelper
  def test_roles
    assert_respond_to @object, :total
  end
end
