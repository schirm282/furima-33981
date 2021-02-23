class AddRecordIdToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses, :record_id, :integer
  end
end
