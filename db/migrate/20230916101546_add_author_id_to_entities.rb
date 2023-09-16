class AddAuthorIdToEntities < ActiveRecord::Migration[7.0]
  def change
    # add_column :entities, :author_id, :integer
    # add_foreign_key :entities, :users, column: :author_id
  end
end
