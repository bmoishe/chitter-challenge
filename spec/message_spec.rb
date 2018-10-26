require './lib/message.rb'
require 'pg'

  describe Message do
  it 'creates a message' do
    message = Message.new("Hi")
    # persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
    expect(message).to be_a Message
  end
end

  describe '.all' do
    it 'returns all message' do
      message = Message.new("Message1")
      Message.new("Message2")
      Message.new("Message3")
      # bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      # Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'test2')
      # Bookmark.create(url: 'http://www.google.com', title: 'test3')
      messages = Message.all
      expect(messages.length).to eq 3
      expect(messages.first).to be_a Message
      # expect(messages.first.id).to eq message.first['id']
      # expect(messages.first.time).to eq 'time - work out how to do this'
      # expect(messages.first.posted_by).to eq 'username - work out how to do this'
    end
  end
#
