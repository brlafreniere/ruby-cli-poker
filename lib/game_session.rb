require './lib/player'
require './lib/round'

class GameSession
  MIN_AI_PLAYERS = 1
  MAX_AI_PLAYERS = 5

  class InvalidNumberOfAiPlayers < StandardError; end;

  def initialize
    @rounds = []
  end

  def start
    init_human_player
    init_ai_players
    start_round
  end

  def prompt_human_player_name
    $stdout.print "What is your name? "
    player_name = $stdin.gets || ""
    player_name.strip
  end

  def init_human_player
    player_name = prompt_human_player_name
    @human_player = Player.new(player_name)
  end

  def init_ai_players
    num_players = prompt_number_of_ai_players
    create_ai_players(num_players)
  end

  def create_ai_players(num)
    if num > MAX_AI_PLAYERS || num <= 0
      msg = "Number of AI players must be between #{MIN_AI_PLAYERS} #{MAX_AI_PLAYERS}"
      raise InvalidNumberOfAiPlayers.new(msg)
    end
    @ai_players = Array.new(num) {|n| Player.new("AI Player ##{n+1}") }
  end

  def prompt_number_of_ai_players
    $stdout.print "Enter number of AI players (1-5): "
    num_ai_players = $stdin.gets.to_i
  end

  def start_round
    round = Round.new(self)
    @rounds << round
    round.start
  end
end