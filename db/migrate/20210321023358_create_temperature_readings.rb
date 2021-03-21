class CreateTemperatureReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :temperature_readings do |t|
      t.decimal :reading, precision: 5, scale: 2
      t.string :status
      t.references :sensor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
