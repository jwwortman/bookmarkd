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

  test "associated shelves should be destroyed" do
    @library.save
    @library.shelves.create!(name: "Shelf A", description: "Lorem ipsum")
    assert_difference 'Shelf.count', -1 do
      @library.destroy
    end
  end

  #test "associated books should be destroyed" do
  #  @library.save
  #  @library.books.create!(title: "Book Title", author: "Book Author", publisher: "Book Publisher", isbn: "00000-00000")
  #  assert_difference 'Book.count', -1 do
  #    @library.destroy
  #  end
  #end
end
