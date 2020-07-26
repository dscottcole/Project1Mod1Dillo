class AddCatchphrase < ActiveRecord::Migration[6.0]
  def change
      add_column :characters, :catchphrase, :string
  end
end
