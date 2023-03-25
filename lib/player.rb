class Player
  STARTING_CHIP_AMOUNT = 100

  attr_accessor :chips

  class NameTooLongError < StandardError; end
  class NameMustBeStringError < StandardError; end

  def initialize(player_name)
    raise NameMustBeStringError.new("Player name must be a string") unless player_name.is_a? String
    raise NameTooLongError.new("Player name exceeds 50 characters") if player_name.length > 50
    @player_name = player_name
    @chips = STARTING_CHIP_AMOUNT
  end
end