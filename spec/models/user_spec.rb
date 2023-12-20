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
require 'rails_helper'

RSpec.describe User, type: :model do
  it "trueである時、falseになること" do
    expect(User.new).not_to eq(nil)
  end
end
