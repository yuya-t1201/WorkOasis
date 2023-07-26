# == Schema Information
#
# Table name: workspaces
#
#  id              :bigint           not null, primary key
#  address         :string(255)      not null
#  facilities      :string(255)      default([]), is an Array
#  latitude        :float
#  longitude       :float
#  price           :integer          default("0~500円")
#  recommendation  :text
#  title           :string(100)      not null
#  workspace_image :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#
# Indexes
#
#  index_workspaces_on_user_id  (user_id)
#
class Workspace < ApplicationRecord
  belongs_to :user

  has_many :workspace_tags, dependent: :destroy
  has_many :tags, through: :workspace_tags

  validates :title, presence: true, length: { maximum: 100 }
  validates :address, presence: true
  validates :recommendation, presence: true

  mount_uploader :workspace_image, ImageUploader

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum price: {
    '0~500円': 0,
    '500~1000円': 1,
    '1000~1500円': 2,
    '1500~2000円': 3,
    '2000円以上': 4
  }

  def price=(price_str)
    self[:price] = Workspace.prices[price_str]
  end

  def save_tag(sent_tags)
    current_tags = tags.pluck(:name) unless tags.nil?
    sent_tags = sent_tags.uniq
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags
    old_tags.each do |old|
      tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_workspace_tag = Tag.find_or_create_by(name: new)
      tags << new_workspace_tag
    end
  end

end

