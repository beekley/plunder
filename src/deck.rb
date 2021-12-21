require 'squib'
require 'game_icons'

ship_data = Squib.csv file: 'cardData/ships.csv'

# Generate ship cards.
Squib::Deck.new cards: ship_data['title'].size, layout: 'src/ship.yml' do
  # Card layout.
  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe' 
  text str: "last built: #{Time.now}", layout: 'build'
  svg data: ship_data['icon'].map{|x|
      GameIcons.get(x).recolor(fg: '333', bg: 'FFF').string
    },
    layout: 'art'

  # Descriptive elements.
  text str: ship_data['title'], layout: 'title'
  text str: ship_data['abilities'].map.with_index { |x, i|
      "abilities: #{x}."
    },
    layout: 'abilities'
  text str: ship_data['description'], layout: 'description'
  # We have to use `map` here to combine the "power" column with the "toughness" column.
  text str: ship_data['power'].map.with_index { |x, i|
      # "power/toughness".
      "#{x}/#{ship_data['toughness'][i]}"
    },
    layout: 'statline'

  # Slots.
  for slot_i in 1..5 do
    text str:
      ship_data["slot#{slot_i}_location"].map.with_index { |x, i|
        unless x.to_s.strip.empty?
          "#{x} slot\n#{ship_data["slot#{slot_i}_type"][i]}"
        end
      },
      layout: "bonus#{slot_i}"
   end

  save_png
end