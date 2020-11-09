class Board < ApplicationRecord
  # 16:00
  validates :title, presence: true ,length: {minimum: 4}
end
