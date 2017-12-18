class CreateHourlyScores < ActiveRecord::Migration[5.1]
  def change
    create_table :hourly_scores do |t|
    	t.references :user, index: true
    	t.string :workout
    	t.boolean :hydrated, default: false
      t.timestamps
    end
  end
end
