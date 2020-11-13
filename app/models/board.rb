class Board < ApplicationRecord
  # 11/9-16:00
  validates :title, presence: true ,length: {minimum: 4}
end
