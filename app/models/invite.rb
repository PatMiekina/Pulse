class Invite < ApplicationRecord
  belongs_to :owner
  belongs_to :attendee
  belongs_to :group
end
