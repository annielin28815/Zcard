class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  default_scope { where(deleted_at: nil).order(id: :desc) }
  validates :content, presence: true


  def owned_by?(user)
    self.user == user
  end

  def destroy
    # Time.now -> 現在的時間
    update(deleted_at: Time.now)
  end
end
