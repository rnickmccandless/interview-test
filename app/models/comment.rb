class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :photo

  validates :comment, presence: true, length: { maximum: 250 }

  scope :with_user, -> { includes(:user) }
end
