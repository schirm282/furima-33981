class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_source_area
  belongs_to :record

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン(−)を入力してください"}
    validates :delivery_source_area_id, numericality: { other_than: 1 }
    validates :municipality,  format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "市区町村を入力してください"}
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "電話番号を入力してください"}
    validates :record_id
  end
end
