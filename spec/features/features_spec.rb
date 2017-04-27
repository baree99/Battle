require 'spec_helper'

require_relative '../../app'

describe Battle do

    before do
      sign_in_and_play
    end
    scenario 'players entered Nigel and Peter' do
      expect(page).to have_content 'Nigel' && 'Peter'
    end

    scenario "player1 can see player2's hit points" do
      expect(page).to have_content Player::HP_DEFAULT
    end

    scenario 'player1 attacks player2' do
      click_button 'Attack'
      expect(page).to have_content "attacked"
    end

    scenario 'someone wins the battle' do
      19.times { click_button 'Attack' }
      expect(page).to have_content 'wins flawless victory!'
    end
  end
