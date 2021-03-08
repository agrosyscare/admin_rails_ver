class CreateGreenhouses < ActiveRecord::Migration[6.1]
  def change
    create_table :greenhouses do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
