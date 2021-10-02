class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewer
end
