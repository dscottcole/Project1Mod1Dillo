class AddDatetimeColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :date, :date
    add_column :orders, :time, :time
  end
end
