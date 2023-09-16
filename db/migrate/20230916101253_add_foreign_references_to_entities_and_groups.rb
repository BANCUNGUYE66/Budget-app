class AddForeignReferencesToEntitiesAndGroups < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :group, null: false, foreign_key: { to_table: :groups, on_delete: :cascade }
    add_reference :groups, :entity, foreign_key: { to_table: :entities }
  end
end
