class CreateHands < ActiveRecord::Migration[8.1]
  def change
    create_table :hands do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true
      t.integer :table_size
      t.integer :button_seat
      t.integer :blind_small
      t.integer :blind_big
      t.integer :ante

      t.timestamps
    end
  end
end
