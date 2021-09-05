class Group < ApplicationRecord
  belongs_to :event
  belongs_to :owner
end
