class Comment < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  belongs_to :post

  default_scope { order(id: :desc) }

  validates :content, presence: true



  # def destroy
  #   Time.now -> 現在的時間
  #   update(deleted_at: Time.now)
  # end
end
