class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.datetime :start
      t.datetime :end
      t.integer :total_needed

      t.timestamps
    end
  end
end
