class RemoveFitnesslvlFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :fitnesslvl, :string
  end
end
