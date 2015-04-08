class Shelf < ActiveRecord::Base
  belongs_to :library
  has_and_belongs_to_many :books
  default_scope -> { order(created_at: :desc) }
  validates :library_id, presence: true
  validates :name, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 140 }
end
