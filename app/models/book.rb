class Book < ApplicationRecord
  belongs_to :category
  has_many :deposits
  end
