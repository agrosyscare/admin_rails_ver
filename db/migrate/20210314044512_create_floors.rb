class CreateFloors < ActiveRecord::Migration[6.1]
  def change
    create_table :floors do |t|
      t.string :name
      t.string :plant_type
      t.belongs_to :greenhouse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
