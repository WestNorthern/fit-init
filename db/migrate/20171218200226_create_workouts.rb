class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
    	t.string :title
    	t.text :description
    	t.string :video_url
    	t.integer :min_lvl
    	t.integer :min_reps
    	t.string :type

      t.timestamps
    end
  end
end
