class CreateFloors < ActiveRecord::Migration[6.1]
  def change
    create_table :floors do |t|
      t.string :name
      t.string :plant_type
      t.datetime :deleted_at
      t.belongs_to :greenhouse, null: false, foreign_key: true

      t.timestamps
    end
    add_index :floors, :deleted_at
  end
end
