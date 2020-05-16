class AddHouryHourToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :elapsed_time, :integer
    add_column :posts, :hourly_wage, :integer
  end
end
