class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.string :system
      t.string :dev_company
      t.string :release_year
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
