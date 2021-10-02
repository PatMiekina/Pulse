class Event < ApplicationRecord
  belongs_to :location
  belongs_to :host, class_name: "User"
  has_many_attached :photos
  has_many :groups
  has_many :favorites
  has_many :reviews
  # has_many :invites, dependent: :destroy, through: :groups

  def my_rating
      rating_sum = 0
      self.reviews.each do |review|
        rating_sum += review.rating
      end
      rating = rating_sum.fdiv(self.reviews.length).round(1)
  end

end
