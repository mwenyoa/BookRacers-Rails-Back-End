class Category < ApplicationRecord
  has_many :motorcycles, dependent: :destroy
  validates :catname, :image, presence: true, uniqueness: true
  has_one_attached :image
end
