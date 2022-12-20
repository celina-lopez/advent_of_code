file_data = File.open("data.txt").readlines.map(&:chomp)

total = 0 

def find_cleaning_chores(data)
  first_num,second_num = data.split("-")
  (first_num..second_num).to_a
end

file_data.each do |data|
  first_elf,second_elf = data.split(",")
  first_elf_cleaning_chores = find_cleaning_chores(first_elf)
  second_elf_cleaning_chores = find_cleaning_chores(second_elf)
  overlapping = (first_elf_cleaning_chores & second_elf_cleaning_chores)
  if overlapping.any?
    total += 1
  end
end;nil

puts total
