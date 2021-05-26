class AddUserAttributes < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :rut, :string
    add_column :users, :firstname, :string
    add_column :users, :middlename, :string
    add_column :users, :lastname, :string
    add_column :users, :mothername, :string
    add_column :users, :phone, :string
  end
end
