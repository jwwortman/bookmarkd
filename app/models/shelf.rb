class Shelf < ActiveRecord::Base
  belongs_to :library
  has_many :bookshelves, dependent: :destroy
  has_many :books, :through => :bookshelves, dependent: :destroy

  default_scope -> { order(created_at: :desc) }
  
  validates :library_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 140 }

  def add_to_shelf(a_book)
    bookshelves.create(book_id: a_book.id)
  end

  def remove_from_shelf(a_book)
    bookshelves.find_by(book_id: a_book.id).destroy
  end

  def books?(a_book)
    books.include?(a_book)
  end
end
