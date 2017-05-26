class AddColumnToSms < ActiveRecord::Migration[5.0]
  def change
    add_column :sms_notifications, :response, :string
  end
end
