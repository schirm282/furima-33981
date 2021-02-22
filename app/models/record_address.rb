class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_source_area_id, :municipality, :house_number, :building, :phone_number, :record_id, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "ハイフン(−)を入力してください"}
    validates :delivery_source_area_id, numericality: { other_than: 1 }
    validates :municipality, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "市区町村を入力してください"}
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "電話番号を入力してください"}
  end
  with_options presence: true do
    validates :item_id
    validates :user_id
  end

  def save
    record = Record.create!(item_id: item_id, user_id: user_id)
    Address.create!(postal_code: postal_code, delivery_source_area_id: delivery_source_area_id, municipality: municipality, house_number: house_number, building: building, phone_number: phone_number, record_id: record.id)
  end
end