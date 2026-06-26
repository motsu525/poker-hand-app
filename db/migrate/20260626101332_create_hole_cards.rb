class CreateHoleCards < ActiveRecord::Migration[8.1]
  def change
    create_table :hole_cards do |t|
      t.references :hand, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.string :card1
      t.string :card2

      t.timestamps
    end
  end
end
