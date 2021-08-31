class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.string :title, null: false
      t.text :introduction
      t.string :image_id
      t.string :serving, null: false

      t.timestamps
    end
  end
end
