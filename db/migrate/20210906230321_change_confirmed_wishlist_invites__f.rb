class ChangeConfirmedWishlistInvitesF < ActiveRecord::Migration[6.0]
  def change
    change_column_default :invites, :wishlist, from: true, to: false
    change_column_default :invites, :confirmed, from: true, to: false
  end
end
