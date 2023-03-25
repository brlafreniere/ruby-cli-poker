require './spec/spec_helper'
require './lib/player'

RSpec.describe Player do
  describe '::new' do
    let(:long_player_name) { "a" * 51 }
    let(:exactly_fifty_chars) { "b" * 50 }

    it 'does not allow player name longer than 50 characters' do
      expect { Player.new(long_player_name) }.to raise_error Player::NameTooLongError
    end

    it 'name must be a string' do
      expect { Player.new(123) }.to raise_error Player::NameMustBeStringError
    end

    it 'accepts a valid string' do
      expect { Player.new(exactly_fifty_chars) }.to_not raise_error
    end

    context 'after initialization' do
      let(:player) { Player.new("Blaine") }
      it 'has starting chips' do
        expect(player.chips).to eq(Player::STARTING_CHIP_AMOUNT)
      end
    end
  end
end