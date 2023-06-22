class CreateWorkspaces < ActiveRecord::Migration[7.0]
  def change
    create_table :workspaces do |t|
      t.string :title, null: false, limit: 100
      t.string :address, null: false, limit: 255
      t.integer :price, default: 0
      t.string :facilities, limit: 255, array: true, default: [], null: true
      t.text :recommendation
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
