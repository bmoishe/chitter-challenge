require './lib/user.rb'
require 'pg'

  describe User do
  it 'create a user' do
    user = User.create(username: "test", email: "test@chitter.com", password: "password")
    # persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
    expect(user).to be_a User
  end

  it 'store user in user database' do
      user = User.new(username: "test", email: "test@chitter.com", password: "password")
    persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM username WHERE username = #{user.username};")

    expect(user).to be_a User
    # expect(user.id).to eq persisted_data.first['id']
    expect(user.username).to eq "test"
    expect(user.email).to eq "test@chitter.com"
    expect(user.password).to eq "password"
  end
end
