# rock paper scissors

VALUES = { ROCK: 1, PAPER: 2, SCISSORS: 3 }
WEAPONS  = { X: :ROCK, A: :ROCK, Y: :PAPER, B: :PAPER, Z: :SCISSORS, C: :SCISSORS }
WINNING_OUTCOMES = {ROCK: :SCISSORS, SCISSORS: :PAPER, PAPER: :ROCK}

WIN = 6
DRAW = 3
LOST = 0

file_data = File.open("data.txt").readlines.map(&:chomp).map { |x| x.split(" ") }

total_score = 0
file_data.each do |elf_weapon_key, your_weapon_key|
  your_weapon = WEAPONS[your_weapon_key.to_sym]
  elf_weapon = WEAPONS[elf_weapon_key.to_sym]
  # you win
  if WINNING_OUTCOMES[your_weapon] == elf_weapon
    total_score+= VALUES[your_weapon] + 6
  # draw 
  elsif your_weapon == elf_weapon
    total_score+= VALUES[your_weapon] + 3
  #  you lose
  else
    total_score+= VALUES[your_weapon]
  end
end

puts total_score
