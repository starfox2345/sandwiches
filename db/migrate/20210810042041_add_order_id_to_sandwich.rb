class AddOrderIdToSandwich < ActiveRecord::Migration[6.1]
  def change
    add_column :sandwiches, :order_id, :integer
  end
end
