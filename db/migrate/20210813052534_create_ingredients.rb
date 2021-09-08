class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id, null: false
      t.string :name, null: false
      t.string :amount
      t.float :protein, default: 0, null: false
      t.float :carbohydrate, default: 0, null: false
      t.float :fat, default: 0, null: false

      t.timestamps
    end
  end
end
