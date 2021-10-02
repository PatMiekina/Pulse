class AddEventToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :event, null: true, foreign_key: true
  end
end
