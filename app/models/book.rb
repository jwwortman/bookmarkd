class Book < ActiveRecord::Base
  has_many :catalogs, dependent: :destroy
  has_many :libraries, :through => :catalogs, dependent: :destroy

  has_many :bookshelves, dependent: :destroy
  has_many :shelves, :through => :bookshelves, dependent: :destroy
  
  default_scope -> { order(title: :asc) }

  validates :title, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 140 }
  validates :publisher, presence: true, length: { maximum: 140 }
  validates :isbn, presence: true
  validates :format, presence: true
  validates :location, presence: true, length: { maximum: 140 }

  FORMAT_TYPES = ["Physical", "Digital", "Audio"]

  def add_to_book(a_shelf)
    bookshelves.create(shelf_id: a_shelf.id)
  end

  def remove_from_book(a_shelf)
    bookshelves.find_by(shelf_id: a_shelf.id).destroy
  end

  def shelves?(a_shelf)
    books.include?(a_book)
  end
end