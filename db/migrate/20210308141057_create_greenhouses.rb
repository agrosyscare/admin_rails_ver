class CreateGreenhouses < ActiveRecord::Migration[6.1]
  def change
    create_table :greenhouses do |t|
      t.string :name
      t.text :description
      t.datetime :deleted_at

      t.timestamps

    end
    add_index :greenhouses, :deleted_at
  end
end
