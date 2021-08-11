class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_name
      t.integer :user_id
      t.integer :sandwich_id
      t.timestamps
    end
  end
end
