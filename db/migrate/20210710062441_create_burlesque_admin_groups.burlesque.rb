# This migration comes from burlesque (originally 20190319134355)
class CreateBurlesqueAdminGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :burlesque_admin_groups do |t|
      t.belongs_to :group, foreign_key: {to_table: :burlesque_groups}
      t.belongs_to :adminable, polymorphic: true, index: { name: "by_adminable" }

      t.timestamps
    end
  end
end
