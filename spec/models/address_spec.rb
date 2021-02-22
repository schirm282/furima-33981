require 'rails_helper'

RSpec.describe Address, type: :model do
 before do
   @address = FactoryBot.build(:address)
 end

 describe '商品購入機能' do
   context '商品購入がうまくいく時' do
     it "postal_code,delivery_source_area_id,municipality,house_number,phone_number,record_idが存在すれば登録できる"
   end
 end
end
