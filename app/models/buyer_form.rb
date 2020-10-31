class BuyerForm

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :tel, :buyer
  
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :municipality
    validates :address
    validates :tel
    
  end
    
    
    
  
  def save
    
    Buyers.create(user_id: user.id, item_id: item.id)
    Destinations.create(postal_code: postal_code, municipality: municipality, address: address, building: building, tel: tel, prefecture_id: prefecture_id)
  end
end
  