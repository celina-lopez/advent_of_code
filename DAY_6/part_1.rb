file_data = File.open("data.txt").readlines.map(&:chomp)[0].split("")
# first four unique letters
four_array = []
file_data.each_with_index do |character, idx|
  four_array << character
  four_array.slice!(0) if four_array.size == 5
  if four_array.uniq.size == 4
    puts idx + 1
    exit
  end
end;nil
