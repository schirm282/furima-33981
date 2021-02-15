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
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :state_id
      validates :delivery_fee_id
      validates :delivery_source_area_id
      validates :days_to_delivery_id
    end
    validates :price, format: { with: /\A[0-9]+\z/, message: '半角数字のみで入力してください' },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '範囲内の金額を入力してください' }
  end
end
