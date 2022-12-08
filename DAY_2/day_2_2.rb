# rock paper scissors

VALUES = { ROCK: 1, PAPER: 2, SCISSORS: 3 }
WEAPONS  = { A: :ROCK, B: :PAPER, C: :SCISSORS }
OUTCOMES  = { X: :LOSE, Y: :DRAW, Z: :WIN }
WINNING_OUTCOMES = {ROCK: :SCISSORS, SCISSORS: :PAPER, PAPER: :ROCK}
LOSSING_OUTCOMES = WINNING_OUTCOMES.invert

WIN = 6
DRAW = 3
LOST = 0

file_data = File.open("data.txt").readlines.map(&:chomp).map { |x| x.split(" ") }

total_score = 0
file_data.each do |elf_weapon_key, outcome_key|
  elf_weapon = WEAPONS[elf_weapon_key.to_sym]
  outcome = OUTCOMES[outcome_key.to_sym]
  # you win
  if outcome == :WIN
    total_score+= VALUES[LOSSING_OUTCOMES[elf_weapon]] + 6
  # draw 
  elsif outcome == :DRAW
    total_score+= VALUES[elf_weapon] + 3
  #  you lose
  else
    total_score+= VALUES[WINNING_OUTCOMES[elf_weapon]]
  end
end

puts total_score
