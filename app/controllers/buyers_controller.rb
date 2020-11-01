class BuyersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new
  end
  
  def new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new(buyer_params)
    
    if @buyer_form.valid?
      @buyer_form.save
      
      redirect_to root_path
      
    else
      render action: :index
  end
end
 
  private
  def buyer_params
    params.require(:buyer_form).permit(:postal_code, :prefecture_id, :municipality, :address, :tel, :building).merge(item_id: params[:item_id], user_id: @item.user_id)
  end

end
