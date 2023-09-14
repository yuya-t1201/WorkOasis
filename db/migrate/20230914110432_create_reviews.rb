class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.float :all_rating
      t.float :rating1
      t.float :rating2
      t.float :rating3
      t.float :rating4
      t.references :user, null: false, foreign_key: true
      t.references :workspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
