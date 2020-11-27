class Post < ApplicationRecord
  belongs_to :board
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def owned_by?(user)
    # 下行前面的user是belongs_to :user做出來的、後面的user是owned_by?(user)做出來的
    self.user == user
  end
end
