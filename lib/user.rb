require 'sinatra/base'
require 'pg'



class User
  attr_reader :username, :email, :password

  def initialize(username:, email:, password:)
    @username = username
    @email = email
    @password = password
  end

  def self.create(username:, email:, password:)
    if ENV['test_database']
      con = PG.connect(dbname: 'chitter_test')
    else
      con = PG.connect(dbname: 'chitter')
    end
    con.exec("INSERT INTO username (username, email, password) VALUES ('#{username}', '#{email}', '#{password}') RETURNING id, username, email, password");
    User.new(username: ['username'], email: ['email'], password:['password'], )
  end
end
