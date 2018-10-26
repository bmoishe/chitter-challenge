require 'sinatra/base'
require './lib/message.rb'

class Chitter < Sinatra::Base
  # before do
  #   @messages = Message.all
  # end
# enable :sessions
attr_accessor :peep

  get '/' do
    if ENV['test_database']
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
      results = con.exec("SELECT * FROM messages;")
      @messages = results.map { |message|
      { message: message['message'] }}
    erb :index

  end

  post '/post_message' do
    @peep = params[:s_message]
      Message.send_message(message: @peep)
    redirect '/'
  end

  run! if app_file == $0
end
