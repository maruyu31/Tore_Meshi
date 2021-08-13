class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.integer :recipe_id, null: false
      t.string :name, null: false
      t.string :amount

      t.timestamps
    end
  end
end
