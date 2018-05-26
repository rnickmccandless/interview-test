class Photo < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates_presence_of :image
  validates :caption, presence: true, length: { maximum: 250 }

  def average_rating
    comments.average :rating
  end
end
