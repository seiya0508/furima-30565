class BuyerForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :item_id, :user_id, :token, :price

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :tel, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, municipality: municipality, address: address, building: building, tel: tel, prefecture_id: prefecture_id, buyer_id: buyer.id)
  end
end
