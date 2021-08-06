class CreateSandwiches < ActiveRecord::Migration[6.1]
  def change
    create_table :sandwiches do |t|
      t.string :name
      t.string :temperature
      t.float :price
      t.string :condition

      t.timestamps
    end
  end
end
