# == Schema Information
#
# Table name: workspaces
#
#  id              :bigint           not null, primary key
#  address         :text             not null
#  latitude        :float
#  longitude       :float
#  price           :integer          default("1~500")
#  recommendation  :text
#  spot_type       :string           not null
#  title           :string(100)      not null
#  workspace_image :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
# Indexes
#
#  index_workspaces_on_address  (address) UNIQUE
#  index_workspaces_on_title    (title) UNIQUE
#  index_workspaces_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Workspace, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
