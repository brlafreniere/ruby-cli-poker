require './spec/spec_helper'

RSpec.describe Round do
  subject { Round.new(game_session) }
  let(:game_session) { GameSession.new }

  describe '#start' do
    after do
      subject.start
    end

    it 'deals cards to all players' do
      expect(subject).to receive(:deal_cards)
    end

    it 'prompt an initial round of betting'
    it 'transfer first round bets from players to the pot'

    it 'prompt players to discard and re-draw up to 3 cards, or stand pat'

    it 'prompt a second round of betting'
    it 'transfer second round bets from players to the pot'

    it 'reveal hands'
    it 'evaluate the value of each hand'
    it 'determine who won the round'
    it 'transfer the pot to the winner'
    it 'determine if game over (player out of chips, or all AI out of chips)'
  end

  describe '#deal_cards' do
    it 'deals cards to human player'
    it 'deals cards to ai players'
  end
end