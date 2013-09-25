require './app/models/word.rb'

file = File.open('./words')

file.each_line do |word|
  chomped = word.chomp
  sorted = chomped.split(//).sort.join
  Word.create({:word => chomped, :sorted => sorted})
end
