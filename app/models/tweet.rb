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
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
end
