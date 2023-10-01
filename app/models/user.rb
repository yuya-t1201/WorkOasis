# == Schema Information
#
# Table name: users
#
#  id               :bigint           not null, primary key
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

  mount_uploader :avatar, AvatarUploader

  has_many :authentications, dependent: :destroy
  has_many :workspaces
  accepts_nested_attributes_for :authentications
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likes_workspaces, through: :likes, source: :workspace

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] } 
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def has_reviewed?(workspace)
    self.reviews.exists?(workspace_id: workspace.id)
  end

  def like(workspace)
    likes_workspaces << workspace
  end

  def unlike(workspace)
    likes_workspaces.destroy(workspace)
  end

  def likes?(workspace)
    likes.exists?(workspace: workspace)
  end
end
