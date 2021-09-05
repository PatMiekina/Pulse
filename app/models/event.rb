class Event < ApplicationRecord
  belongs_to :location
  belongs_to :host, class_name: "User"
  has_many_attached :photos
  has_many :groups
  # has_many :invites, dependent: :destroy, through: :groups
end
