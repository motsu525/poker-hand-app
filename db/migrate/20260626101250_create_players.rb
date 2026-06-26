class CreatePlayers < ActiveRecord::Migration[8.1]
  def change
    create_table :players do |t|
      t.references :hand, null: false, foreign_key: true
      t.string :name
      t.integer :seat_number
      t.integer :stack
      t.boolean :is_hero

      t.timestamps
    end
  end
end
