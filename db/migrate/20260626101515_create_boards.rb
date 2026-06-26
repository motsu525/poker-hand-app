class CreateBoards < ActiveRecord::Migration[8.1]
  def change
    create_table :boards do |t|
      t.references :hand, null: false, foreign_key: true
      t.string :flop1
      t.string :flop2
      t.string :flop3
      t.string :turn
      t.string :river

      t.timestamps
    end
  end
end
