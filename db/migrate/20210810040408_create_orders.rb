class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.boolean :delivery
      t.integer :user_id
      t.integer :sandwich_id
      t.timestamps
    end
  end
end
