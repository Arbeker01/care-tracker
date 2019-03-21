class DailyActivitiesController < ApplicationController

get '/daily_activities'  do
	@daily_activities = DailyActivity.all 
	erb :'/all_daily_activities'
end

get '/daily_activities/new'  do
	erb :'/daily_activities/new'
end

get '/daily_activities/:id' do
	@daily_activity  = DailyActivity.find_by_id(params[:id])
	erb :'/daily_activities/show'
end

post '/daily_activities' do
	@daily_activity = DailyActivity.create(location: params[:location], description: params[:description], books: params[:books], medication: params[:medication], care_giver_id: current_user.id)
	redirect '/daily_activities/#{@daily_activity.id}'
end

get '/daily_activities/:id/edit' do
	erb :'/daily_activities/edit'
end

patch '/daily_activities/:id' do
	@daily_activity = DailyActivity.find_by_id(params[:id])
	@daily_activity.update
	redirect '/daily_activities/#{@daily_activity.id}'
end

delete '/daily_activities/:id' do
	@daily_activity = DailyActivity.find_by_id(params[:id])
	@daily_activity.destroy	
end

end
