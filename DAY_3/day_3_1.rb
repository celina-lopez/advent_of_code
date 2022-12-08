# split half a list
# find likeness
# get priporties 
require 'byebug'
scores = ("a".."z").to_a.append(("A".."Z").to_a).flatten

file_data = File.open("data.txt").readlines.map(&:chomp)
range = file_data.length / 3

total = 0 

file_data.each_with_index do |data, r|
  if r % 3 == 0
    first,second,third = [file_data[r], file_data[r + 1], file_data[r+2]]
    common = first.split("") & second.split("") & third.split("")
    common.each do |c|
      total += scores.find_index(c) + 1
    end
  end
end;nil

puts total
