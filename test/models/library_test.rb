require 'test_helper'

class LibraryTest < ActiveSupport::TestCase
  def setup
    @user = users(:jacob)
    @library = @user.build_library(name: "User Library")
  end

  test "should be valid" do
    assert @library.valid?
  end

  test "user id should be present" do
    @library.user_id = nil
    assert_not @library.valid?
  end

  test "name should be present " do
    @library.name = "   "
    assert_not @library.valid?
  end

  test "name should be at most 100 characters" do
    @library.name = "a" * 101
    assert_not @library.valid?
  end
end
