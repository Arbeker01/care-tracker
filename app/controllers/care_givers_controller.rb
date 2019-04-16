class CareGiversController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'care_givers/create_care_giver'
    else
       redirect '/daily_activities'
    end
  end


  post '/signup' do
    @care_giver = CareGiver.create(name:  params[:name], email: params[:email], password: params[:password])
      if params[:name] != "" && params[:email] != "" && params[:password] != ""
         session[:care_giver_id] = @care_giver.id
           redirect '/daily_activities'
      else
        redirect '/signup'
      end
  end

  get '/login'  do
    if logged_in?
      redirect '/daily_activities'
    else 
      erb :'/care_givers/login'
    end
  end
  
  post '/login' do
    @care_giver = CareGiver.find_by(:email => params[:email])
     if @care_giver && @care_giver.authenticate(params[:password])
        session[:care_giver_id] = @care_giver.id
         redirect '/daily_activities'
     else
         redirect '/signup'
     end
  end

  

  get '/logout' do 
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end

end