# == Schema Information
#
# Table name: reviews
#
#  id           :bigint           not null, primary key
#  comment      :text
#  integer      :integer          default(0), not null
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
FactoryBot.define do
  factory :review do
    comment { "MyText" }
    all_rating { 1.5 }
    rating1 { 1.5 }
    rating2 { 1.5 }
    rating3 { 1.5 }
    rating4 { 1.5 }
    user { nil }
    workspace { nil }
  end
end
