# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
#  avatar           :string
#  crypted_password :string
#  email            :string           not null
#  name             :string
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  has_many :workspaces
  accepts_nested_attributes_for :authentications

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] } 
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }
end
