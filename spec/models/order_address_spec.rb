require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @order_address = FactoryBot.build(:order_address, item_id: item.id, user_id: user.id)
      sleep 0.1
    end

    context '内容に問題がない場合（正常系）' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合（異常系）' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'delivery_from_idを選択していないと保存できないこと' do
        @order_address.delivery_from_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery from can't be blank")
      end
      it 'townが空だと保存できないこと' do
        @order_address.town = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Town can't be blank")
      end
      it 'home_numberが空だと保存できないこと' do
        @order_address.home_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Home number can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが9桁以内だと保存できないこと' do
        @order_address.telephone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneが12桁以上だと保存できないこと' do
        @order_address.telephone = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'telephoneで半角数字以外が含まれると保存できないこと' do
        @order_address.telephone = '123456789十'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid")
      end
      it 'user_idが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end
