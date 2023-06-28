class AddWorkspaceImageToWorkspaces < ActiveRecord::Migration[7.0]
  def change
    add_column :workspaces, :workspace_image, :string
  end
end
