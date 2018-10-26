require 'sinatra/base'
require './lib/message.rb'

class Chitter < Sinatra::Base
  # before do
  #   @messages = Message.all
  # end
# enable :sessions
attr_accessor :peep
attr_accessor :time

  get '/' do
    if ENV['test_database']
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    results = con.exec("SELECT * FROM messages ORDER BY messages DESC;")
    @messages = results.map { |message|
      { message: message['message'], time: message['time']}}

    erb :index
  end

  post '/post_message' do
    @peep = params[:s_message]
    @time = Time.new
      Message.send_message(message: @peep, time: @time)
    redirect '/'
  end

  run! if app_file == $0
end
