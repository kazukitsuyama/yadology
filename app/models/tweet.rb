class Tweet < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :yado_title
    validates :yado_name
    validates :text
    validates :date
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :area_id
  end

  belongs_to :user
  has_many_attached :images
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
end
