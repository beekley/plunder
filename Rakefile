require 'squib'

task default: [:deck]

task :deck do
  sh "curl 'https://docs.google.com/spreadsheets/d/1SV8VB8KNjVy2acICk6ZNY3HaWjszx8Pu-WrdYQ5hsEM/gviz/tq?tqx=out:csv&sheet=Ships'  -L -o cardData/ships.csv"
  sh "curl 'https://docs.google.com/spreadsheets/d/1SV8VB8KNjVy2acICk6ZNY3HaWjszx8Pu-WrdYQ5hsEM/gviz/tq?tqx=out:csv&sheet=Items'  -L -o cardData/items.csv"
  load 'src/ship.rb'
  load 'src/item.rb'
end
