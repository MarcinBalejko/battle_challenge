feature 'Attacking' do
    context 'After clicking Attack link' do
        before do
            sign_in_and_play
            click_link 'Attack'
        end
        scenario 'attack Player 2' do
            sign_in_and_play
            click_link 'Attack'
            expect(page).to have_content 'Dave attacked Mittens'
        end
        scenario 'reduce Player 2 HP by 10' do
            sign_in_and_play
            click_link 'Attack'
            click_link 'OK' 
            expect(page).not_to have_content 'Mittens: 60HP'
            expect(page).to have_content 'Mittens: 50HP'
        end
    end
end
