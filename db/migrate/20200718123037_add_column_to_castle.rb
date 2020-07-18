class AddColumnToCastle < ActiveRecord::Migration[6.0]
  def change
    add_column :castles, :city, :string
    add_column :castles, :zipcode, :string
    add_column :castles, :country, :string
  end
end
