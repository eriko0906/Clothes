class CreateCloths < ActiveRecord::Migration[6.0]
  def change
    create_table :cloths do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.string :name
      t.integer :amount

      t.timestamps
    end
    add_index :cloths, [:user_id, :category_id, :created_at]
  end
end
