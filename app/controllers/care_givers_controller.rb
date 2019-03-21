class CareGiversController < ApplicationController

get '/login'  do
  erb :'care_givers/login'
end


post '/login' do
	 @care_giver = CareGiver.find_by(:name => params[:name], :password => params[:password])
	 session[:care_giver_id] = @care_giver.id
	 redirect 'daily_activities/all_daily_activities'
end


get '/signup' do
  erb :'care_givers/create_care_giver'
end


post '/signup' do
  @care_giver = CareGiver.new(:name => params[:name], :email => params[:email], :password => params[:password])
  @care_giver.save
    session[:care_giver_id] = @care_giver.id
    redirect 'daily_activities/all_daily_activities'
end

get '/care_givers/:id' do
     @care_giver = CareGiver.find_by(id: params[:id])
     erb :'care_givers/show'
end

get '/logout' do 
  session.clear
  redirect "/care_givers/login"
end

end