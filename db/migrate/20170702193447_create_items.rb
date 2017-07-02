class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :image
      t.text :specification
      t.string :category
      t.decimal :price
      t.references :company, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :companies
  end
end
