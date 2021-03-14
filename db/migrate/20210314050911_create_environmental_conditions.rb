class CreateEnvironmentalConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :environmental_conditions do |t|
      t.string :name

      t.timestamps
    end
  end
end
