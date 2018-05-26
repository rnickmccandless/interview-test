class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_presence_of :image
  validates :caption, presence: true, length: { maximum: 250 }

  scope :with_comments, -> { includes(:comments) }

  def average_rating
    comments.average(:rating)&.round(2) || 0
  end
end
