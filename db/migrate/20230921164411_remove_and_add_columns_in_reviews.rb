class RemoveAndAddColumnsInReviews < ActiveRecord::Migration[7.0]
  def change
    remove_column :reviews, :rating1
    remove_column :reviews, :rating2
    remove_column :reviews, :rating3
    remove_column :reviews, :rating4

    add_column :reviews, :rating, :integer, default: 0, null: false
  end
end
