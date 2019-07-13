feature 'Game over' do
  context 'when Player 1 reaches 0 HP first' do
    before do
      sign_in_and_play
      attack_and_confirm
      allow_any_instance_of(Kernel).to receive(:rand).and_return(60)
    end
    scenario 'Player 1 loses' do
        click_button 'Attack'
        expect(page).to have_content 'Dave loses!'
    end
  end
end 
  
