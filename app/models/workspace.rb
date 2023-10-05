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
#  user_id         :integer
#
# Indexes
#
#  index_workspaces_on_address  (address) UNIQUE
#  index_workspaces_on_title    (title) UNIQUE
#  index_workspaces_on_user_id  (user_id)
#
class Workspace < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :address, presence: true, uniqueness: true
  validates :recommendation, presence: true

  mount_uploader :workspace_image, ImageUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  scope :latest, -> { order(created_at: :desc) }
  scope :old, -> { order(created_at: :asc) }
  scope :highest_rated, -> {
  left_joins(:reviews)
    .group('workspaces.id')
    .order(Arel.sql('COALESCE(SUM(reviews.rating), 0) DESC'))
  }

  enum price: { '1~500': 0, '500~1000': 1, '1000~1500': 3, '1500~2000': 4, '2000~': 5
  }

  def calculate_average_rating
    reviews.sum(:rating)
  end

  def liked_by?(user)
    likes.exists?(user_id: user_id)
  end
end

