require 'squib'

task default: [:deck]

task :deck do
  sh "curl 'https://docs.google.com/spreadsheets/d/1SV8VB8KNjVy2acICk6ZNY3HaWjszx8Pu-WrdYQ5hsEM/export?format=csv'  -L -o data.csv"
  load 'deck.rb'
end
