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

  scenario "User posts a message and I can see all messages including that message" do
    visit('/')
    fill_in :s_message, with: 'Hey Donald'
    click_button 'Peep'
    fill_in :s_message, with: 'Hey Kanye'
    click_button 'Peep'
    expect(page).to have_content 'Hey Donald'
  end
end
