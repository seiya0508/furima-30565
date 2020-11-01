class BuyerForm

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :item_id, :user_id
  
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :tel
    
  end
    
    
    
  
  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Destination.create(postal_code: postal_code, municipality: municipality, address: address, building: building, tel: tel, prefecture_id: prefecture_id, buyer_id: buyer.id)
  end
end
  