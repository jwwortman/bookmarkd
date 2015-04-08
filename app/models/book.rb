class Book < ActiveRecord::Base
	has_and_belongs_to_many :libraries
	has_and_belongs_to_many :shelves
	#validates :library_id, presence: true
	validates :title, presence: true, length: { maximum: 140 }
	validates :author, presence: true, length: { maximum: 140 }
	validates :publisher, presence: true, length: { maximum: 140 }
	validates :isbn, presence: true, length: { maximum: 140 }
end
