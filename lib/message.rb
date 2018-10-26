class Message
attr_reader :post
  def initialize(peep)
    @peep = peep.to_s
    return @peep
  end

  def self.all
    if ENV['test_database....create new database']
      con = PG.connect(dbname: 'messages_test...create new test database')
    else
      con = PG.connect(dbname: 'messages...create new database')
    end
      results = con.exec("SELECT * FROM messages....create new table;")

      results.map { |message| Message.new(@peep) }
  end
end
