class CreateSensors < ActiveRecord::Migration[6.1]
  def change
    create_table :sensors do |t|
      t.string :model
      t.string :serial
      t.belongs_to :environmental_condition, null: false, foreign_key: true
      t.belongs_to :arduino, null: false, foreign_key: true
      t.belongs_to :floor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
