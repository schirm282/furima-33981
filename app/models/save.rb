class Save
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_source_area_id, :municipality, :house_number, :building, :phone_number, :name, :image, :delivery_fee_id, :price, :nickname, :first_name, :last_name, :first_frigana, :last_frigana

  # Addressのカラム
  with_options presence: true do
    validates :postal_code
    validates :delivery_source_area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number
  end
  # Recordのitemカラム
  with_options presence: true do
    validates :name
    validates :image  
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :price
  end
  # Recordのuserのカラム
  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力してください' } do
      validates :first_frigana
      validates :last_frigana
    end
  end

  def save
    user = User.create(last_name: last_name, first_name: first_name, last_frigana: last_frigana, first_frigana: first_frigana, nickname: nickname)
    Address.create(postal_code: postal_code, delivery_source_area_id: delivery_source_area_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, user_id: user_id)
    Item.create(name: name, image: image, delivery_fee_id: delivery_fee_id, price: price, user_id: user_id)
  end
end