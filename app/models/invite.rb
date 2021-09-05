class Invite < ApplicationRecord
  belongs_to :owner, class_name: "User"
  belongs_to :attendee, class_name: "User"
  belongs_to :group
end
