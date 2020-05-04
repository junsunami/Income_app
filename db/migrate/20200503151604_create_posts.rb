class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :price
      t.text :description
      t.integer :start_date
      t.integer :end_date

      t.timestamps
    end
  end
end
