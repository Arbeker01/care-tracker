class DailyActivitiesController < ApplicationController

	get '/daily_activities'  do
		  
		if logged_in?
		  @daily_activities = DailyActivity.all  #daily activities not persisting from this point
		    erb :'/daily_activities/index'
	    else
		   redirect '/signup'
	    end
	end

	get '/daily_activities/new'  do
		if logged_in?
		  erb :'/daily_activities/new'
	    else
	      redirect '/login'
	    end
	end

	get '/daily_activities/:id' do
		if logged_in?
		@daily_activity  = DailyActivity.find_by(id: params[:id])
		erb :'/daily_activities/show'
	    else
		redirect '/login'
	    end
	end

	post '/daily_activities' do
		if !logged_in?
			redirect '/'
		end
		if params[:location] != "" && params[:description] != "" && params[:books] != "" && params[:medication] != ""
		@daily_activity = DailyActivity.create(location: params[:location], description: params[:description], books: params[:books], medication: params[:medication], care_giver_id: current_user.id)
		   redirect '/daily_activities'
	    else
		    erb :'/daily_activities/new'
	    end
	end

	

	get '/daily_activities/:id/edit' do
		set_daily_activity
		if logged_in?
			if authorized_to_edit?(@daily_activity)
		      erb :'/daily_activities/edit'
		    else
	          redirect '/daily_activities'
	        end
	    else
	    	redirect '/login'
	    end
	end

	patch '/daily_activities/:id' do
		if logged_in?
			if params[:location] == "" && params[:description] == "" && params[:books] == "" && params[:medication] == ""
				erb  :'/daily_activities/#{params[:id]}/edit'
			else
	           @daily_activity = DailyActivity.find_by(id: params[:id])
	             if @daily_activity && @daily_activity.care_giver == current_user
	             	if @daily_activity.update(location: params[:location], description: params[:description], books: params[:books], medication: params[:medication])
		              redirect '/daily_activities'
		            else
		              erb :'/daily_activities/#{@daily_activity.id}/edit'
		            end
		         else
		         	redirect '/signup'
		         end
		    end
		else
			redirect '/login'
		end
	end

	delete '/daily_activities/:id' do
		if logged_in?
		  @daily_activity = DailyActivity.find_by(id: params[:id])
		   if @daily_activity && @daily_activity.care_giver == current_user
		      @daily_activity.destroy	
		   end
		      redirect '/daily_activities'
		else
		  redirect '/login'
		end
	end

	
	
end
