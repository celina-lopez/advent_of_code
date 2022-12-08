file_data = File.open("data.txt").readlines.map(&:chomp)

total_calories = []
calorie_count = 0

file_data.each do |data|
  if data != ""
    calorie_count += data.to_i
  else
    total_calories << calorie_count
    calorie_count = 0
  end
end

total = total_calories.sort!.last(3).sum

puts total_calories
puts total
