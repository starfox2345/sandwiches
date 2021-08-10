class AddUserIdToSandwiches < ActiveRecord::Migration[6.1]
  def change
    add_column :sandwiches, :user_id, :integer
  end
end
