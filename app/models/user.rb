class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, class_name: "Event", foreign_key: "host_id"
  has_many :places, class_name: "Location", foreign_key: "owner_id"
  has_many :groups, class_name: "Group", foreign_key: "owner_id"
  has_many :invites, class_name: "Invite", foreign_key: "owner_id"
  has_many :invites, class_name: "Invite", foreign_key: "attendee_id"

  has_many :favorites, class_name: "Favorite", foreign_key: "owner_id"
  has_many :favorites, class_name: "Favorite", foreign_key: "user_id"

  has_one_attached :photo

  def my_events
    my_events = []
    self.invites.each do |invite|
      if invite.confirmed
        my_events << invite.group.event
      end
    end
    my_events
  end

  def my_wishlist
    my_wishlist = []
    self.invites.each do |invite|
      if invite.wishlist
        my_wishlist << invite.group.event
      end
    end
    my_wishlist
  end
end
