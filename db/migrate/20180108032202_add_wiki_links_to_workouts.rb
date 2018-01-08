class AddWikiLinksToWorkouts < ActiveRecord::Migration[5.1]
  def change
    add_column :workouts, :wiki_link, :string
  end
end
