class AddDateTime < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :date_time, :string
  end
end
