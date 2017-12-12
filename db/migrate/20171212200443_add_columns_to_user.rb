class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :location, :string
    add_column :users, :experience, :integer
    add_column :users, :coins, :integer
    add_column :users, :height, :decimal
    add_column :users, :weight, :decimal
    add_column :users, :age, :integer
    add_column :users, :fitnesslvl, :string
    add_column :users, :gender, :string
  end
end
