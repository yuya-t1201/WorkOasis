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
  validates :title, presence: true, length: { maximum: 100 }
  validates :address, presence: true
  validates :facilities, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :recommendation, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum price: {
    '0~500円': 0,
    '500~1000円': 1,
    '1000~1500円': 2,
    '1500~2000円': 3,
    '2000円以上': 4
  }
end

