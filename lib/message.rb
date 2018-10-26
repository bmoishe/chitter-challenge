require 'sinatra/base'
require 'pg'

class Message
# attr_reader :message

  def initialize(message:)
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
  def self.send_message(message: message)
    if ENV['test_database']
       con = PG.connect(dbname: 'chitter_test')
     else
       con = PG.connect(dbname: 'chitter')
     end
    con.exec("INSERT INTO messages(message) VALUES('#{message}') RETURNING message")
    Message.new(message:['message'])
  end

end
