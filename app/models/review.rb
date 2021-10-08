class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :reviewer, class_name: "User"
  belongs_to :event, optional: true
end
