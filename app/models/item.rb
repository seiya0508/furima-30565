class Item < ApplicationRecord

  belongs_to :user
  has_one :buyer
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_day
  belongs_to_active_hash :delivery_area

  with_options presence: true do

  validates :name
  validates :description
  validates :price
  validates :image
  validates :shipping_days_id, numericality: { other_than: 1 } 
  validates :delivery_area_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 


end
end
