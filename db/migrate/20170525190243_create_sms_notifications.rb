class CreateSmsNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :sms_notifications do |t|


      t.string :to
      t.string :from

      t.string :body

      t.boolean :sent

      t.timestamps
    end
  end
end
