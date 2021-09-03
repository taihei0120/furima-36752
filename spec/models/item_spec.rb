require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    #context '商品の出品ができる場合' do
      #it "product_name、product_description、product_category_id、product_condition_id、delivery_fee_id、delivery_from_id、delivery_day_id、price、imageが存在すれば登録できる" do
      #  expect(@item).to be_valid
      #end
    #end
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
    
    end

  end
end
