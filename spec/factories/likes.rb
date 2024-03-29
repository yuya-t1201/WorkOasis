# == Schema Information
#
# Table name: likes
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#  workspace_id :bigint           not null
#
# Indexes
#
#  index_likes_on_user_id                   (user_id)
#  index_likes_on_user_id_and_workspace_id  (user_id,workspace_id) UNIQUE
#  index_likes_on_workspace_id              (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (workspace_id => workspaces.id)
#
FactoryBot.define do
  factory :like do
    user { nil }
    workspace { nil }
  end
end
