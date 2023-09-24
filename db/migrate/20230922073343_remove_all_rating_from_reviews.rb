class RemoveAllRatingFromReviews < ActiveRecord::Migration[7.0]
  def up
    remove_column :reviews, :all_rating
  end

  def down
    add_column :reviews, :all_rating, :float
  end
end
