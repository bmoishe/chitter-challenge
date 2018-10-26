feature "Posting a message" do
  scenario "Visiting the index page" do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario "User posts a message and I can see that message" do
    visit('/')
    fill_in :s_message, with: 'Hey'
    click_button 'Peep'
    expect(page).to have_content 'Hey'
  end

  scenario "User posts a message and I can see all messages
  including that message" do
    visit('/')
    fill_in :s_message, with: 'Hey Donald'
    click_button 'Peep'
    fill_in :s_message, with: 'Hey Kanye'
    click_button 'Peep'
    expect(page).to have_content 'Hey Donald'
  end

  scenario "sign up" do
    visit('/')
    click_button 'sign_up'
    fill_in :email, with: 'test@chitter.com'
    fill_in :username, with: 'Test User'
    fill_in :password, with: 'password'
    click_button 'sign_up_now'
    expect(page).to have_content 'Test User'
  end
end
