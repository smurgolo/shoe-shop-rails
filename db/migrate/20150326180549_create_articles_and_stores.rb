class CreateArticlesAndStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address

      t.timestamps null: false
    end

    create_table :articles do |t|
      t.belongs_to :store, index:true
      t.string :name
      t.string :description
      t.integer :price
      t.integer :total_in_shelf
      t.integer :total_in_vault

      t.timestamps null: false
    end
  end
end
