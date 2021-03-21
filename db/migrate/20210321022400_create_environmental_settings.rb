class CreateEnvironmentalSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :environmental_settings do |t|
      t.decimal :min_value, precision: 5, scale: 2
      t.decimal :max_value, precision: 5, scale: 2
      t.references :environmental_conditions, null: false, foreign_key: true
      t.references :floor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
