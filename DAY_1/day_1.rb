file_data = File.open("data.txt").readlines.map(&:chomp)

most_calories = 0
calorie_count = 0

file_data.each do |data|
  if data != ""
    calorie_count += data.to_i
  else
    most_calories = [most_calories, calorie_count].max
    calorie_count = 0
  end
end

puts most_calories
