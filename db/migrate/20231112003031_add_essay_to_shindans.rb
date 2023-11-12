class AddEssayToShindans < ActiveRecord::Migration[6.1]
  def change
    add_column :shindans, :essay, :integer
  end
end
