class Group < ApplicationRecord
  belongs_to :event
  belongs_to :owner, class_name: "User"
  has_many :invites
end
