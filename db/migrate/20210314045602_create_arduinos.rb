class CreateArduinos < ActiveRecord::Migration[6.1]
  def change
    create_table :arduinos do |t|
      t.string :model
      t.string :serial
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :arduinos, :deleted_at
  end
end
