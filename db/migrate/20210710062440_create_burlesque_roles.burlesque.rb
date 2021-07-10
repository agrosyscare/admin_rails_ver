# This migration comes from burlesque (originally 20190319134212)
class CreateBurlesqueRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :burlesque_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
