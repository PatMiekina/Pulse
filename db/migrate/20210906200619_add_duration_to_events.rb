class AddDurationToEvents < ActiveRecord::Migration[6.0]
  def change
     add_column :events, :duration, :integer
  end
end
