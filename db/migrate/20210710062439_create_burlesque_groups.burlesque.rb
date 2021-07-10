# This migration comes from burlesque (originally 20190319134128)
class CreateBurlesqueGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :burlesque_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
