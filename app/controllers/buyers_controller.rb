class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_form = BuyerForm.new(buyer_params)
    if @buyer_form.valid?
      pay_item
      @buyer_form.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_form).permit(:postal_code, :prefecture_id, :municipality, :address, :tel, :building).merge(item_id: params[:item_id], user_id: @item.user_id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: buyer_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    
    @item = Item.includes(:user).find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

end
