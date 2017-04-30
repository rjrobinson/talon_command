class CreateEventRosters < ActiveRecord::Migration[5.0]
  def change
    create_table :event_rosters do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true

      t.string :status

      t.boolean :approved
      t.string :approved_by

      t.timestamps
    end
  end
end
