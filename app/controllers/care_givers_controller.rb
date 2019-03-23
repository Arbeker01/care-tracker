class CareGiversController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'care_givers/create_care_giver'
    else
       redirect 'daily_activities/all_daily_activities'
    end
  end


  post '/signup' do
    @care_giver = CareGiver.new(:name => params[:name], :email => params[:email], :password => params[:password])
      if params[:name] != "" && params[:email] != "" && params[:password] != ""
         @care_giver.save
         session[:care_giver_id] = @care_giver.id
           redirect 'daily_activities/all_daily_activities'
      else
           redirect '/signup'
      end
  end

  get '/login'  do
    if logged_in?
      redirect 'daily_activities/all_daily_activities'
    else 
      erb :'care_givers/login'
    end
  end
  
  post '/login' do
    @care_giver = CareGiver.find_by(:name => params[:name])
     if @care_giver && @care_giver.authenticate(params[:password])
        session[:care_giver_id] = @care_giver.id
         redirect 'daily_activities/all_daily_activities'
     else
         redirect 'care_givers/login'
     end
  end

  get '/care_givers/:id' do
       @care_giver = CareGiver.find_by(id: params[:id])
       erb :'care_givers/show'
  end

  get '/logout' do 
    if logged_in?
      session.clear
      redirect 'care_givers/login'
    else
      redirect '/'
    end
  end

end