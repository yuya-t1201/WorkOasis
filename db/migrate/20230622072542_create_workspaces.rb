class CreateWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :workspaces do |t|
      t.string :title, null: false, limit: 100
      t.string :address, null: false, limit: 255
      t.integer :price, default: 0
      t.text :recommendation
      t.string :workspace_image
      t.float :latitude
      t.float :longitude
      t.integer :user_id

      t.timestamps
    end

     add_index :workspaces, :user_id
  end
end
