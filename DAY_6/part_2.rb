file_data = File.open("data.txt").readlines.map(&:chomp)[0].split("")
# first fourteen unique letters
fourteen_array = []
file_data.each_with_index do |character, idx|
  fourteen_array << character
  fourteen_array.slice!(0) if fourteen_array.size == 15
  if fourteen_array.uniq.size == 14
    puts idx + 1
    exit
  end
end;nil
