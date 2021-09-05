class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.references :owner, null: false, index: true, foreign_key: { to_table: :users }
      t.references :attendee, index: true, foreign_key: { to_table: :users }
      t.references :group, null: false, foreign_key: true
      t.text :message
      t.boolean :wishlist
      t.boolean :confirmed

      t.timestamps
    end
  end
end
