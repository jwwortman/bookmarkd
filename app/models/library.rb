class Library < ActiveRecord::Base
  belongs_to :user
  has_many :shelves, dependent: :destroy
  #has_many :catalogs, dependent: :destroy
  #has_many :books, :through => :catalogs

  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
end