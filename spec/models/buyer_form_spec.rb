require 'rails_helper'

RSpec.describe BuyerForm, type: :model do
  before do
    @buyer_form = FactoryBot.build(:buyer_form)
  end

  describe '購入登録' do
    context '購入登録がうまくいくとき' do
  it "任意項目以外の記入がされていること" do
    expect(@buyer_form).to be_valid
  end

  context '購入登録がうまくいかないとき' do
    it "カード情報の記入が空だと購入できない" do
      @buyer_form.token = ''
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号が空だと購入できない" do
      @buyer_form.postal_code = ''
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it "都道府県が空だと購入できない" do
      @buyer_form.prefecture_id = ''
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "市区町村が空だと購入できない" do
      @buyer_form.municipality = ''
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Municipality can't be blank")
    end
    it "番地が空だと購入できない" do
      @buyer_form.address = ''
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号が空だと購入できない" do
      @buyer_form.tel = ''
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Tel can't be blank")
    end
    it "郵便番号7桁かつハイフンが無いと購入できない" do
      @buyer_form.postal_code = '1234567'
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Postal code is invalid")
    end
    it "電話番号がハイフン無しで11桁以内で記入しないと購入できない" do
      @buyer_form.tel = '012345678901'
      @buyer_form.valid?
      expect(@buyer_form.errors.full_messages).to include("Tel is invalid")
    end
    



  
  end
 end
end
end
