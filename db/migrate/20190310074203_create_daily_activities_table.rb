class CreateDailyActivitiesTable < ActiveRecord::Migration
  def change
  	create_table :daily_activities do |t|
  		t.string :location
  		t.string :description
  		t.string :books
  		t.string :medication
  		t.integer :care_giver_id

  		t.timestamps null: false
  	end
  end
end
