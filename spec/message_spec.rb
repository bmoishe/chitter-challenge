require './lib/message.rb'
require 'pg'

  describe Message do
  it 'creates a message' do
    message = Message.new(message: "Hi")
    # persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
    expect(message).to be_a Message
  end
end

# describe '.all' do
#   it 'returns a list of bookmarks' do
#     bookmarks = Message.send_message
#
#     expect(bookmarks).to include "hey"
#     expect(bookmarks).to include "yo"
#     expect(bookmarks).to include "wagwan"
#   end
# end

#   describe '.all' do
#     it 'returns all message' do
#       message = Message.new("Message1")
#       Message.new("Message2")
#       Message.new("Message3")
#   messages = Message.all
#       expect(messages.length).to eq 3
#       expect(messages.first).to be_a Message
#       end
#   end
# #
