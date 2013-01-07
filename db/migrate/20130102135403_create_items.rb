class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :price, :precision => 5, :scale => 2
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
