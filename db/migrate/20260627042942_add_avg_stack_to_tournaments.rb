class AddAvgStackToTournaments < ActiveRecord::Migration[8.1]
  def change
    add_column :tournaments, :avg_stack, :integer
  end
end
