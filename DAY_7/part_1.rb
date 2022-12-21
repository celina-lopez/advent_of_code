require 'byebug'

file_data = File.open("data.txt").readlines.map(&:chomp)
# cd / come up only once 
file_data.slice!(0)

GO_UP = "$ cd .."
GO_DOWN = "$ cd "
DIR = "dir "

path = []
computer = {}

def action?(input_data)
  input_data.start_with?("$")
end

def action!(path, input_data)
  if input_data == GO_UP
    path.pop
  elsif input_data.start_with?(GO_DOWN)
    path.push(input_data.split(GO_DOWN).pop)
  end
end

def calc_file_size!(path, computer, input_data)
  size = input_data.split(" ")[0].to_i
  path.size.times do |idx|
    computer[path[0..idx].join('.')] ||= 0
    computer[path[0..idx].join('.')] += size
  end
end

file_data.each do |data|
  action?(data) ? action!(path, data) : calc_file_size!(path, computer, data)
end;nil

total = computer.values.filter { |file_size| file_size <= 100000 }.sum
puts total
