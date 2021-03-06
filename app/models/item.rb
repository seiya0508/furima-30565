class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :condition
  belongs_to_active_hash :category

  with_options presence: true do
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than: 10_000_000 }
    validates :image
    validates :shipping_day_id
    validates :delivery_area_id
    validates :delivery_charge_id
    validates :condition_id
    validates :category_id
  end
end
