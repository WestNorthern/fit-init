class AddCompleteToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :complete, :boolean, default: false
  end
end
