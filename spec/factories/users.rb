# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  address          :string
#  avatar           :string
#  crypted_password :string
#  email            :string           not null
#  latitude         :float
#  longitude        :float
#  name             :string
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    email { 'john@example.com' }
    password { 'password123' }
  end
end
