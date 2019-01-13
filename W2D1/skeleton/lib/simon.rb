class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    round_success_message
    @sequence_length += 1
  end

  def show_sequence
    p seq
    add_random_color
  end

  def require_sequence

  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message

  end

  def game_over_message
    "The game is over, play again?"
  end

  def reset_game
    @game_over = false
    @seq = []
    @sequence_length = 1
  end
end
