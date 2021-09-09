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
    events = []
    invites = Invite.all
    invites.each do |invite|
      if invite.confirmed && (invite.owner || invite.attendee) == self
        events << invite.group.event
      end
    end
    events
  end

  def my_events_wishlist
    favorites = Favorite.all.select { |favorite| favorite.owner == self && favorite.event != nil }
    wishlist = favorites.map { |favorite| favorite.event }
    wishlist
  end

  def my_friends
    friends = []
    invites = Invite.all
    invites.each do |invite|
      if invite.confirmed && invite.owner == self
        friends << invite.attendee
      elsif invite.confirmed && invite.attendee == self
        friends << invite.owner
      end
    end
    friends
  end

  # Find following users for a user instance
  def my_following
    favorites = Favorite.all.select { |favorite| favorite.owner == self && favorite.user != nil }
    following = favorites.map { |favorite| favorite.user }
    following
  end
end
