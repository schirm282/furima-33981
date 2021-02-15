require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいく時' do
      it 'name,explanation,image,category_id,state_id,delivery_fee_id,delivery_source_area_id,days_to_delivery_id,priceが存在すれば出品ができる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば出品ができる' do
        @item.price = '11111'
        expect(@item).to be_valid
      end
      it 'priceが指定した金額の範囲内なら出品ができる' do
        @item.price = '300'
        expect(@item).to be_valid
      end
    end
    context '商品の出品がうまくいかない時' do
      it 'nameが空の場合、出品ができない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'explanationが空の場合、出品ができない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'imageが何も指定されてないと、出品ができない' do
      end
      it 'category_idが何も指定されてないと、出品ができない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'state_idが何も指定されてないと、出品ができない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end
      it 'delivery_fee_idが何も指定されてないと、出品ができない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it 'delivery_source_area_idが何も指定されてないと、出品ができない' do
        @item.delivery_source_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery source area must be other than 1')
      end
      it 'days_to_delivery_idが何も指定されてないと、出品ができない' do
        @item.days_to_delivery_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Days to delivery must be other than 1')
      end
      it 'priceが空の場合、出品ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外だと、出品ができない' do
      end
      it 'priceが指定した金額の範囲外の場合、出品ができない' do
        @item.price = '100'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 範囲内の金額を入力してください')
      end
    end
  end
end
