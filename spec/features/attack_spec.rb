feature 'Attacking' do
    describe 'Switch turns' do
        context 'seeing the current turn' do
            scenario 'at the start of the game' do
                sign_in_and_play
                expect(page).to have_content "Dave's turn"
            end
    
            scenario 'after player 1 attacks' do
                sign_in_and_play
                click_link 'Attack'
                click_link 'OK'
                expect(page).not_to have_content "Dave's turn"
                expect(page).to have_content "Mittens's turn"
            end
        end
    end
    context 'After clicking Attack link' do
        before do
            sign_in_and_play
            click_link 'Attack'
        end
        scenario 'attack second player' do
            sign_in_and_play
            click_link 'Attack'
            expect(page).to have_content 'Dave attacked Mittens'
        end
        scenario 'reduce second player HP by 10' do
            sign_in_and_play
            click_link 'Attack'
            click_link 'OK' 
            expect(page).not_to have_content 'Mittens: 60HP'
            expect(page).to have_content 'Mittens: 50HP'
        end
    end
end
