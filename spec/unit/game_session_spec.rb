require './spec/spec_helper'
require './spec/shared_examples/input_prompt'

require './lib/game_session'

RSpec.describe GameSession do
  let(:player_name) { "Blaine" }

  describe '#start' do
    subject { GameSession.new }

    before do
      # stub these methods to skip stdout/stdin calls
      allow(subject).to receive(:prompt_human_player_name).and_return(player_name)
      allow(subject).to receive(:prompt_number_of_ai_players).and_return(GameSession::MIN_AI_PLAYERS)
    end

    after do
      subject.start
    end

    it 'initializes human player' do
      expect(subject).to receive(:init_human_player)
    end

    it 'initializes AI players' do
      expect(subject).to receive(:init_ai_players)
    end

    it 'starts the first round' do
      expect(subject).to receive(:start_round)
    end
  end

  describe '#init_human_player' do
    let(:player) { Player.new(player_name) }

    before do
      # stub prompting method, return canned response
      allow(subject).to receive(:prompt_human_player_name).and_return(player_name)
    end

    after do
      subject.init_human_player
    end

    it 'prompts user for their name' do
      expect(subject).to receive(:prompt_human_player_name)
    end

    it 'initializes Player object' do
      expect(subject).to receive(:prompt_human_player_name).and_return(player_name)
      expect(Player).to receive(:new).with(player_name)
    end

    it 'sets @human_player' do
      subject.init_human_player
      expect(subject.instance_variable_get(:@human_player)).to be_a Player
    end
  end

  describe '#prompt_human_player_name' do
    it_behaves_like "input_prompt"

    after do
      subject.prompt_human_player_name
    end
  end

  describe '#init_ai_players' do
    let(:num_players) { GameSession::MAX_AI_PLAYERS }

    before do
      allow(subject).to receive(:prompt_number_of_ai_players).and_return(GameSession::MIN_AI_PLAYERS)
    end

    it 'prompts for number of AI players' do
      expect(subject).to receive(:prompt_number_of_ai_players)
    end

    it 'creates n number of AI players' do
      expect(subject).to receive(:prompt_number_of_ai_players).and_return(num_players)
      expect(subject).to receive(:create_ai_players).with(num_players)
    end

    after do
      subject.init_ai_players
    end
  end

  describe '#prompt_number_of_ai_players' do
    it_behaves_like "input_prompt"

    after do
      subject.prompt_number_of_ai_players
    end
  end

  describe '#create_ai_players' do
    let(:num_players) { GameSession::MAX_AI_PLAYERS }
    let(:ai_players) { subject.instance_variable_get(:@ai_players) }

    it 'creates n players' do
      expect(Player).to receive(:new).exactly(num_players).times
      subject.create_ai_players(num_players)
    end

    it 'sets ai_players instance variable' do
      subject.create_ai_players(num_players)
      expect(ai_players).to all be_a Player
    end

    it 'raises exception if num above max' do
      expect { subject.create_ai_players(num_players+1) }.to raise_error GameSession::InvalidNumberOfAiPlayers
    end

    it 'raises exception if num 0 or less' do
      expect { subject.create_ai_players(0) }.to raise_error GameSession::InvalidNumberOfAiPlayers
    end
  end

  describe '#start_round' do
    let(:rounds) { subject.instance_variable_get(:@rounds) }
    let(:round) { Round.new(subject) }

    it 'creates a new Round instance' do
      expect(Round).to receive(:new).with(subject).and_return(Round.new(subject))
      subject.start_round
    end

    it 'saves the new Round instance' do
      expect(rounds).to be_empty
      subject.start_round
      expect(rounds.first).to be_a Round
    end

    it 'starts the first round' do
      expect(Round).to receive(:new).with(subject).and_return(round)
      expect(round).to receive(:start)
      subject.start_round
    end
  end
end