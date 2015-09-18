class CreateShindans < ActiveRecord::Migration
  def change
    create_table :shindans do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
