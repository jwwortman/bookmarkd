class Library < ActiveRecord::Base
  belongs_to :user
  has_many :shelves, dependent: :destroy
  has_many :catalogs, dependent: :destroy
  has_many :books, :through => :catalogs, dependent: :destroy

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }

  def add_to_library(a_book)
    catalogs.create(book_id: a_book.id)
  end

  def remove_from_library(a_book)
    catalogs.find_by(book_id: a_book.id).destroy
  end

  def books?(a_book)
    books.include?(a_book)
  end
end