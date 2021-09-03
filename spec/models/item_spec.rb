require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができる場合' do
      it "product_name、product_description、product_category_id、product_condition_id、delivery_fee_id、delivery_from_id、delivery_day_id、price、imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it "product_nameが空では登録できない" do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "product_descriptionが空では登録できない" do
        @item.product_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it "product_category_idが空では登録できない" do
        @item.product_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category can't be blank")
      end
      it "product_category_idが1では登録できない" do
        @item.product_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product category must be other than 1")
      end
      it "product_condition_idが空では登録できない" do
        @item.product_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it "product_condition_idが1では登録できない" do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it "delivery_fee_idが空では登録できない" do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "delivery_fee_idが1では登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "delivery_from_idが空では登録できない" do
        @item.delivery_from_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery from can't be blank")
      end
      it "delivery_from_idが1では登録できない" do
        @item.delivery_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery from must be other than 1")
      end
      it "delivery_day_idが空では登録できない" do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it "delivery_day_idが1では登録できない" do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300未満では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが9,999,999超では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが全角数値では登録できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが英語では登録できない" do
        @item.price = 'one thousand'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが漢字では登録できない" do
        @item.price = '千百十二'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "ユーザー情報が紐付いていない場合は出品できないこと" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end

  end
end
