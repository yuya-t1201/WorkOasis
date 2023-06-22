# == Schema Information
#
# Table name: workspaces
#
#  id             :bigint           not null, primary key
#  address        :string(255)      not null
#  facilities     :string(255)      default([]), is an Array
#  latitude       :float
#  longitude      :float
#  price          :integer          default(0)
#  recommendation :text
#  title          :string(100)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Workspace < ApplicationRecord
end
