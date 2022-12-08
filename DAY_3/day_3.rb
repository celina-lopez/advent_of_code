# split half a list
# find likeness
# get priporties 
require 'byebug'
scores = ("a".."z").to_a.append(("A".."Z").to_a).flatten

file_data = File.open("data.txt").readlines.map(&:chomp)
total = 0 
file_data.each do |data|
  first,second = data.partition(/.{#{data.size/2}}/)[1,2]
  common = first.split("") & second.split("")
  # byebug
  common.each do |c|
    total += scores.find_index(c) + 1
  end
end;nil

puts total
