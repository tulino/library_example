class User < ApplicationRecord
  has_many :deposits
  has_many :reviews
end
