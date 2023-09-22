# == Schema Information
#
# Table name: reviews
#
#  id           :bigint           not null, primary key
#  all_rating   :float
#  comment      :text
#  rating       :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#  workspace_id :bigint           not null
#
# Indexes
#
#  index_reviews_on_user_id       (user_id)
#  index_reviews_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (workspace_id => workspaces.id)
#
class Review < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  validates :all_rating, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
end
