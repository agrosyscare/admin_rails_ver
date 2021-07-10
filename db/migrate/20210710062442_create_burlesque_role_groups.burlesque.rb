# This migration comes from burlesque (originally 20190319134555)
class CreateBurlesqueRoleGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :burlesque_role_groups do |t|
      t.belongs_to :role, foreign_key: {to_table: :burlesque_roles}
      t.belongs_to :group, foreign_key: {to_table: :burlesque_groups}

      t.timestamps
    end
  end
end
