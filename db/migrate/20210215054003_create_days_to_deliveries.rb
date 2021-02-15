class CreateDaysToDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :days_to_deliveries do |t|

      t.timestamps
    end
  end
end
