feature 'Attacking' do
        scenario 'attack Player 2' do
            sign_in_and_play
            click_button 'Attack'
            expect(page).to have_content 'Dave attacked Mittens'
        end

        scenario 'be attacked by Player 2' do
            sign_in_and_play
            attack_and_confirm
            click_button 'Attack'
            expect(page).to have_content 'Mittens attacked Dave'
        end

        context 'when dealing set damage' do
            before do
                allow(Kernel).to receive(:rand).and_return(10)
            end

            scenario 'reduce Player 2 HP by 10' do
                sign_in_and_play
                attack_and_confirm
                expect(page).not_to have_content 'Mittens: 60HP'
                expect(page).to have_content 'Mittens: 50HP'
            end
            
            scenario 'reduce Player 1 HP by 10' do
                sign_in_and_play
                2.times { attack_and_confirm }
                expect(page).not_to have_content 'Dave: 60HP'
                expect(page).to have_content 'Dave: 50HP'
            end
        end

        context 'when dealing random damage' do
            scenario 'reduce Player 2 HP by a random amount' do
                sign_in_and_play
                attack_and_confirm
                expect(page).not_to have_content 'Mittens: 60HP'
            end

            scenario 'reduce Player 1 HP by a random amount' do
                sign_in_and_play
                2.times { attack_and_confirm }
                expect(page).not_to have_content 'Dave: 60HP'
            end
        end
end
