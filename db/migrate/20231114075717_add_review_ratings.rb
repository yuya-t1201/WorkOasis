class AddReviewRatings < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :comfort, :integer, default: 0, null: false
    add_column :reviews, :convenience, :integer, default: 0, null: false
    add_column :reviews, :environmental_noise, :integer, default: 0, null: false
    add_column :reviews, :ease_of_work, :integer, default: 0, null: false
    add_column :reviews, :coziness, :integer, default: 0, null: false
  end
end
