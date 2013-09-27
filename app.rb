require './lib/helpers'
require 'sinatra'
require 'data_mapper'

require_relative './lib/user'

env = ENV["RACK_ENV"] || "development"

DataMapper.setup(:default, "postgres://localhost/chatter_#{env}")

require './lib/peep'

DataMapper.finalize

DataMapper.auto_upgrade!

helpers UsersHelper

enable :sessions
set :session_secret, 'super secret'


get '/users/new' do
	 erb :"users/new"
end

post '/users' do
  user = User.create(:name => params[:name],
 			  :email => params[:email], 
              :password => params[:password])
  session[:user_id] = user.id
  redirect to('/')
end



