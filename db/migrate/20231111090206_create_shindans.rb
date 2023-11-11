class CreateShindans < ActiveRecord::Migration[6.1]
  def change
    create_table :shindans do |t|
      t.integer :japanese
      t.integer :math
      t.integer :english
      t.integer :science
      t.integer :society
      t.integer :interview
      t.integer :gd

      t.timestamps
    end
  end
end
