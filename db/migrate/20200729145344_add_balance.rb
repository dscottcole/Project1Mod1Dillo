class AddBalance < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :balance, :float
  end
end
