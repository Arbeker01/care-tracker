require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_app_secret"
  end

  get "/" do
    erb :'welcome'
  end

  # helpers do
   #  def logged_in?
   #  !!current_user
    # end

    # def current_user
     # @current_user ||= CareGiver.find_by(id: session[:care_giver_id]) if session[:care_giver_id]
     #end
   #end

  #def authorized_to_edit?(daily_activity)
   # daily_activity.care_giver == current_user
  #end

  #def redirect_if_not_logged_in
   # if !logged_in?
    #  redirect '/'
   # end
  #end


end
