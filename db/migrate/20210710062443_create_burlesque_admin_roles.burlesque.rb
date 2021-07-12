# This migration comes from burlesque (originally 20190319135759)
class CreateBurlesqueAdminRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :burlesque_admin_roles do |t|
      t.belongs_to :role, foreign_key: {to_table: :burlesque_roles}
      t.belongs_to :authorizable, polymorphic: true, index: { name: "by_authorizable" }

      t.timestamps
    end
  end
end
