# [W] [V]     [P]                    
# [B] [T]     [C] [B]     [G]        
# [G] [S]     [V] [H] [N] [T]        
# [Z] [B] [W] [J] [D] [M] [S]        
# [R] [C] [N] [N] [F] [W] [C]     [W]
# [D] [F] [S] [M] [L] [T] [L] [Z] [Z]
# [C] [W] [B] [G] [S] [V] [F] [D] [N]
# [V] [G] [C] [Q] [T] [J] [P] [B] [M]
#  1   2   3   4   5   6   7   8   9 

rows = {
  1 => "vcdrzgbw".upcase.split(""),
  2 => "gwfcbstv".upcase.split(""),
  3 => "cbsnw".upcase.split(""),
  4 => "qgmnjvcp".upcase.split(""),
  5 => "tslfdhb".upcase.split(""),
  6 => "jvtwmn".upcase.split(""),
  7 => "pflcstg".upcase.split(""),
  8 => "bdz".upcase.split(""),
  9 => "mnzw".upcase.split("")
}

file_data = File.open("data.txt").readlines.map(&:chomp)
# move 2 from 8 to 4

file_data.each do |data|
  omg = data.split(" ")

  move = omg[1].to_i
  from = omg[3].to_i
  to = omg[5].to_i

  items_to_move = rows[from].slice(-(move)..)
  items_left = rows[from].slice(...-(move))

  rows[to].append *items_to_move
  rows[from] = items_left

end;nil

puts rows.values.map { |v| v[-1] }.join('')
