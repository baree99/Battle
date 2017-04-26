def sign_in_and_play
  visit '/'
  fill_in 'player1', with: 'Nigel'
  fill_in 'player2', with: 'Peter'
  click_button 'Submit'
end
