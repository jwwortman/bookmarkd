class Book < ActiveRecord::Base
  has_many :catalogs, dependent: :destroy
  has_many :libraries, :through => :catalogs, dependent: :destroy
  
  validates :title, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 140 }
  validates :publisher, presence: true, length: { maximum: 140 }
  validates :isbn, presence: true, length: { maximum: 140 }
end