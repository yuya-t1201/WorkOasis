class DropTagAndWorkspaceTagTables < ActiveRecord::Migration[7.0]
  def up
    # remove_foreign_key :workspace_tags, :tags # 外部キー制約を削除
    # drop_table :tags
    # drop_table :workspace_tags
  end

  def down
    # create_table :tags do |t|
      # t.string :name
      # t.timestamps
  

    # create_table :workspace_tags do |t|
      # t.references :workspace, foreign_key: true
      # t.references :tag, foreign_key: true
      # t.timestamps
  
  end
end
