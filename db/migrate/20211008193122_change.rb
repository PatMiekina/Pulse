class Change < ActiveRecord::Migration[6.0]
  def change
    change_column_null :reviews, :event_id, true
  end
end
