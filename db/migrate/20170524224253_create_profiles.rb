class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|

      t.references :user

      t.string :phone

      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode


      t.string :certification
      t.string :cert_state

      t.string :role

      t.string :emergency_name
      t.string :emergency_number

      t.timestamps
    end
  end
end
