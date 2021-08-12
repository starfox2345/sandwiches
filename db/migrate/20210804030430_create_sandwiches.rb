class CreateSandwiches < ActiveRecord::Migration[6.1]
  def change
    create_table :sandwiches do |t|
      t.float :price
      t.string :ingredient
      t.integer :category_id

      t.timestamps
    end
  end
end
