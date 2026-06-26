class CreateActions < ActiveRecord::Migration[8.1]
  def change
    create_table :actions do |t|
      t.references :hand, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.string :street
      t.string :action_type
      t.integer :amount
      t.integer :action_order
      t.boolean :is_all_in

      t.timestamps
    end
  end
end
