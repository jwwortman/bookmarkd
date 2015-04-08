require 'test_helper'

class BookTest < ActiveSupport::TestCase

  def setup
    @library = libraries(:jacob_lib)
    #@shelf = shelves(:orange)
    # This code is not idiomatically correct.
    @book = @library.books.build(title: "Book Title", author: "Book Author", publisher: "Book Publisher", isbn: "00000-00000")
  end

  test "should be valid" do
    assert @book.valid?
  end

  #test "library id should be present" do
  #  @book.library_id = nil
  #  assert_not @book.valid?
  #end

  #test "shelf id should be present" do
  #  @book.shelf_id = nil
  #  assert_not @book.valid?
  #end

  test "title should be present " do
    @book.title = "   "
    assert_not @book.valid?
  end

  test "content should be at most 140 characters" do
    @book.title = "a" * 141
    assert_not @book.valid?
  end

  test "author should be present " do
    @book.author = "   "
    assert_not @book.valid?
  end

  test "author should be at most 140 characters" do
    @book.author = "a" * 141
    assert_not @book.valid?
  end

  test "publisher should be present " do
    @book.publisher = "   "
    assert_not @book.valid?
  end

  test "publisher should be at most 140 characters" do
    @book.publisher = "a" * 141
    assert_not @book.valid?
  end

  test "isbn should be present " do
    @book.isbn = "   "
    assert_not @book.valid?
  end

  test "isbn should be at most 140 characters" do
    @book.isbn = "a" * 141
    assert_not @book.valid?
  end
end
