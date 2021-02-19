class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_source_area_id, :municipality, :house_number, :building, :phone_number, :name, :image, :delivery_fee_id, :price

  # Addressのカラム
  with_options presence: true do
    validates :postal_code
    validates :delivery_source_area_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_number
    validates :phone_number
  end
  # Itemのカラム
  with_options presence: true do
    validates :name
    validates :image  
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :price
  end

  def save
    
  end
end