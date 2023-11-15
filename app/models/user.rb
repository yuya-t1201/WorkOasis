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
class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :authentications, dependent: :destroy
  has_many :workspaces, dependent: :destroy
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

  def review_for(workspace)
    reviews.find_by(workspace_id: workspace.id)
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

  def workspaces_within_10km
    if latitude.present? && longitude.present?
      Workspace.near([latitude, longitude], 5)
    else
      []
    end
  end
end
