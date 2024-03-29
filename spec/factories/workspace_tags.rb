# == Schema Information
#
# Table name: workspace_tags
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  tag_id       :bigint           not null
#  workspace_id :bigint           not null
#
# Indexes
#
#  index_workspace_tags_on_tag_id        (tag_id)
#  index_workspace_tags_on_workspace_id  (workspace_id)
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (workspace_id => workspaces.id)
#
FactoryBot.define do
  factory :workspace_tag do
    workspace { nil }
    tag { nil }
  end
end
