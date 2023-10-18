class AddSpotTypeToWorkspaces < ActiveRecord::Migration[7.0]
  def change
    add_column :workspaces, :spot_type, :string, null: false
  end
end