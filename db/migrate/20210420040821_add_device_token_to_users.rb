class AddDeviceTokenToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :device_token, :string
  end

  def down
    remove_columns :users, :device_token
  end
end
