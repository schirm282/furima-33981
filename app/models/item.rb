class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee
  belongs_to :delivery_source_area
  belongs_to :days_to_delivery
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation 
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :delivery_source_area_id
      validates :days_to_delivery_id
    end
    validates :price, format: { with: /\\d{1,3}(,\d{3})*\b(?=.*?[\d])\d(3[0-9][0-9]|[0-9]{,7})/i, message: "半角数字のみで入力してください"}
    validates :user, foreign_key: true
  end
end
