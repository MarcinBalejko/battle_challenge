def sign_in_and_play
    visit('/')
    fill_in :player_1_name, with: 'Dave'
    fill_in :player_2_name, with: 'Mittens'
    click_button 'Submit'
end
def attack_and_confirm
    click_button 'Attack'
    click_button 'OK'
end