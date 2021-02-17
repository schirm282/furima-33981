require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("test/fixtures/test_image.jpg")
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいく時' do
      it 'name,explanation,image,category_id,state_id,delivery_fee_id,delivery_source_area_id,days_to_delivery_id,priceが存在すれば出品ができる' do
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
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが何も指定されてないと、出品ができない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'state_idが何も指定されてないと、出品ができない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end
      it 'delivery_fee_idが何も指定されてないと、出品ができない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it 'delivery_source_area_idが何も指定されてないと、出品ができない' do
        @item.delivery_source_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source area must be other than 1")
      end
      it 'days_to_delivery_idが何も指定されてないと、出品ができない' do
        @item.days_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to delivery must be other than 1")
      end
      it 'priceが空の場合、出品ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが全角文字だと、出品ができない' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字のみで入力してください")
      end
      it 'priceが半角英数混合だと、出品ができない' do
        @item.price = 'aaa111'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字のみで入力してください")
      end
      it 'priceが半角英語だけだと、出品ができない' do
        @item.price = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字のみで入力してください")
      end
      it 'priceが指定した金額の範囲より低い場合、出品ができない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 範囲内の金額を入力してください")
      end
      it 'priceが指定した金額の範囲より高い場合、出品ができない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 範囲内の金額を入力してください")
      end
    end
  end
end
