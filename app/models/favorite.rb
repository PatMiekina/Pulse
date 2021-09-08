class Favorite < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :user, optional: true
  belongs_to :event, optional: true
end
