class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :description
      t.string :image_url
      t.references :user

      t.timestamps
    end
  end
end
