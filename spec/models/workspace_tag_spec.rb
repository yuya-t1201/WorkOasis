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
#  index_workspace_tags_on_tag_id                   (tag_id)
#  index_workspace_tags_on_workspace_id             (workspace_id)
#  index_workspace_tags_on_workspace_id_and_tag_id  (workspace_id,tag_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (workspace_id => workspaces.id)
#
require 'rails_helper'

RSpec.describe WorkspaceTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
