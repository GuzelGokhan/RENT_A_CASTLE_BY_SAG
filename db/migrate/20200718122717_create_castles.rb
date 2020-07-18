class CreateCastles < ActiveRecord::Migration[6.0]
  def change
    create_table :castles do |t|
      t.string :address
      t.string :title
      t.string :photo
      t.integer :price
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
