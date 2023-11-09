class ChangeAddressToTextInWorkspaces < ActiveRecord::Migration[7.0]
  def change
    change_column :workspaces, :address, :text
  end
end
