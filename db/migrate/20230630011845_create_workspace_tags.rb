class CreateWorkspaceTags < ActiveRecord::Migration[7.0]
  def change
    create_table :workspace_tags do |t|
      t.references :workspace, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    add_index :workspace_tags, [:workspace_id, :tag_id], unique: true
  end
end
