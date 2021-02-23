require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
 before do
   @record_address = FactoryBot.build(:record_address)
 end

 describe '商品購入機能' do
   context '商品購入がうまくいく時' do
     it "postal_code,delivery_source_area_id,municipality,house_number,phone_number,token,record_id,item_id,user_idが存在すれば購入できる" do
       expect(@record_address).to be_valid
     end
     it "buildingが空でも、購入できる" do
       @record_address.building = ""
       expect(@record_address).to be_valid
     end
   end
   context '商品購入がうまくいかない時' do
     it "postal_codeが空の時、購入できない" do
       @record_address.postal_code = ""
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Postal code can't be blank")
     end
     it "postal_codeがハイフン(-)を含まない時、購入できない" do
       @record_address.postal_code = 0000000
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Postal code ハイフン(−)を入力してください")
     end
     it "delivery_source_area_idが選択していない時、購入できない" do
       @record_address.delivery_source_area_id = 1
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Delivery source area must be other than 1")
     end
     it "municipalityが空の時、購入できない" do
       @record_address.municipality = ""
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Municipality can't be blank")
     end
     it "municipalityが半角数字を含む時、購入できない" do
       @record_address.municipality = "0000市"
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Municipality 市区町村を入力してください")
     end
     it "municipalityが半角英字を含む時、購入できない" do
       @record_address.municipality = "aaaa町"
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Municipality 市区町村を入力してください")
     end
     it "house_numberが空の時、購入できない" do
       @record_address.house_number = ""
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("House number can't be blank")
     end
     it "phone_numberが空の時、購入できない" do
       @record_address.phone_number = ""
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
     end
     it "phone_numberが12桁以上の時、購入できない" do
       @record_address.phone_number = "0123456789012"
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Phone number 電話番号を入力してください")
     end
     it "phone_numberは英数混合では、購入できない" do
       @record_address.phone_number = "0123456789ab"
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Phone number 電話番号を入力してください")
     end
     it "item_idが空の時、購入できない" do
       @record_address.item_id = ""
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Item can't be blank")
     end
     it "user_idが空の時、購入できない" do
       @record_address.user_id = ""
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("User can't be blank")
     end
     it "tokenが空の時、購入できない" do
       @record_address.token = ""
       @record_address.valid?
       expect(@record_address.errors.full_messages).to include("Token can't be blank")
     end
   end
 end
end
