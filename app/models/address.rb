class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_source_area
  belongs_to :record

  with_options presence: true do
    validates :postal_code
    validates :delivery_source_area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number
  end
end
