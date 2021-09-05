class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.references :location, null: false, foreign_key: true
      t.references :host, index: true, foreign_key: { to_table: :users }
      t.string :category
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
