require 'sinatra/base'
require 'pg'

class Message
# attr_reader :message

  def initialize(message:, time:)
    # @message = message

  end

  # def self.all
  #   if ENV['test_database']
  #     con = PG.connect(dbname: 'chitter_test')
  #   else
  #     con = PG.connect(dbname: 'chitter')
  #   end
  #     results = con.exec("SELECT * FROM messages;")
  #     results.map { |message| Message.new(id: message['id'], messsage: message['message']) }
  # end
  def self.send_message(message: message, time: time)
    if ENV['test_database']
       con = PG.connect(dbname: 'chitter_test')
     else
       con = PG.connect(dbname: 'chitter')
     end
    con.exec("INSERT INTO messages(message, time) VALUES('#{message}', '#{time}') RETURNING message")
    Message.new(message:['message'], time:['time'])
  end

end
