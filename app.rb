require 'sinatra/base'
#require './lib/chitter.rb'

class Chitter < Sinatra::Base
enable :sessions
  get '/' do
    erb :index
  end

  post '/post_message' do
    session[:message] = params[:message]
    redirect '/'
  end

  run! if app_file == $0
end
