class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_source_area_id, :municipality, :house_number, :building, :phone_number, :, :

  # Addressのカラム
  with_options presence: true do
    validates :postal_code
    validates :delivery_source_area_id, :numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number
  end
  # Itemのカラム
  with_options presence: true do
    validates :name
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :delivery_source_area_id
      validates :days_to_delivery_id
    end
    validates :price, format: { with: /\A[0-9]\d+\z/, message: '半角数字のみで入力してください' },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '範囲内の金額を入力してください' }
  end

  # Userのカラム
  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字混合で入力してください' },
                         confirmation: true, length: { minimum: 6 }
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: '全角カタカナのみで入力してください' } do
      validates :first_frigana
      validates :last_frigana
    end
    validates :birthday
  end

  def save
    
  end
end