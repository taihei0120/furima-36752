require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '内容に問題がない場合（正常系）' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building空でも保存できること' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合（異常系）' do
    end

  end
end
