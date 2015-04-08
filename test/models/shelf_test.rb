require 'test_helper'

class ShelfTest < ActiveSupport::TestCase

  def setup
    @library = libraries(:jacob_lib)
    @shelf = @library.shelves.build(name: "Shelf A", description: "Lorem ipsum")
  end

  test "should be valid" do
    assert @shelf.valid?
  end

  test "library id should be present" do
    @shelf.library_id = nil
    assert_not @shelf.valid?
  end

  test "name should be present " do
    @shelf.name = "   "
    assert_not @shelf.valid?
  end

  test "name should be at most 100 characters" do
    @shelf.name = "a" * 101
    assert_not @shelf.valid?
  end

  test "description should be present " do
    @shelf.description = "   "
    assert_not @shelf.valid?
  end

  test "description should be at most 140 characters" do
    @shelf.description = "a" * 141
    assert_not @shelf.valid?
  end

  test "order should be most recent first" do
    assert_equal Shelf.first, shelves(:most_recent)
  end
end
