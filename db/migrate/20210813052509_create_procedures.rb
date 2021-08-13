class CreateProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :procedures do |t|
      t.integer :recipe_id, null: false
      t.string :body, null: 

      t.timestamps
    end
  end
end
