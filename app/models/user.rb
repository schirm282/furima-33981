class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "半角英数字混合で入力してください" }
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "全角文字を使用してください" } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: "全角カタカナのみで入力してください" } do
      validates :first_frigana
      validates :last_frigana
    end
    validates :birthday
  end
end
