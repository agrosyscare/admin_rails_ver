class CreateArduinos < ActiveRecord::Migration[6.1]
  def change
    create_table :arduinos do |t|
      t.string :model
      t.string :serial

      t.timestamps
    end
  end
end
