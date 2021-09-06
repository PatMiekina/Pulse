class ChangeConfirmedWishlistInvites < ActiveRecord::Migration[6.0]
  def change
    change_column_default :invites, :wishlist, to: false
    change_column_default :invites, :confirmed, to: false
  end
end
