class Board < ApplicationRecord
  acts_as_paranoid
  include AASM

  # 11/9-16:00
  validates :title, presence: true ,length: {minimum: 4}

  has_many :posts
  belongs_to :user



  # 12/11-狀態機 -> Let's build an AASM state machine with our custom class.
  aasm(column: 'state', no_direct_assignment: true) do
    state :open, initial: true
    state :hidden, :locked

    event :hide do
      transitions from: :open, to: :hidden

      # 發簡訊
      after do
        puts "發簡訊!!"
      end
    end

    event :lock do
      transitions from: :open, to: :locked
    end

    event :open do
      transitions from: [:locked, :hidden], to: :open
    end
  end

end
