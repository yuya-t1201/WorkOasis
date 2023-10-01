# == Schema Information
#
# Table name: workspaces
#
#  id              :bigint           not null, primary key
#  address         :string(255)      not null
#  facilities      :string(255)      default([]), is an Array
#  latitude        :float
#  longitude       :float
#  price           :integer          default("1~500")
#  recommendation  :text
#  title           :string(100)      not null
#  workspace_image :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :workspace do
    title { "MyString" }
    address { "MyString" }
    price { 1 }
    facilities { "MyString" }
    recommendation { "MyText" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
