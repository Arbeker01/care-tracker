class CareGiversController < ApplicationController

get '/login'  do
  erb :login
end

post '/login' do

end


get '/signup' do
  erb :'care_givers/create_care_giver'

end





end