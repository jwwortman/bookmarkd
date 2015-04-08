class Library < ActiveRecord::Base
  belongs_to :user
  has_many :shelves, dependent: :destroy
  has_and_belongs_to_many :books
  before_destroy { books.clear }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
end
