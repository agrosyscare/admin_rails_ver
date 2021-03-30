class CreateEnvironmentalSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :environmental_settings do |t|
      t.jsonb :settings, null: false, default: '{}'
      t.references :floor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
