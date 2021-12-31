class User < ApplicationRecord
  has_many :notes
  validates :username, presence: true,
          length: { minimum: 4, maximum: 15 },
          uniqueness: true

  # validates :password, presence: true,
  #         length: { minimum: 12, maximum: 20 }
end
