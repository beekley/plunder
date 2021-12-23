require 'squib'
require 'game_icons'

data = Squib.csv file: 'cardData/ships.csv'

# Generate ship cards.
ship_fronts = Squib::Deck.new cards: data['title'].size, layout: 'src/ship.yml' do
  # Card layout.
  background color: 'white'
  rect layout: 'cut'
  rect layout: 'safe' 
  text str: "last built: #{Time.now}", layout: 'build'
  svg data: data['icon'].map{|x|
      GameIcons.get(x).recolor(fg: '333', bg: 'FFF').string
    },
    layout: 'art'

  # Descriptive elements.
  text str: data['title'], layout: 'title'
  text str: data['abilities'], layout: 'abilities'
  text str: data['description'], layout: 'description'
  # We have to use `map` here to combine the "power" column with the "toughness" column.
  text str: data['power'].map.with_index { |x, i|
      # "power/toughness".
      "#{x}/#{data['toughness'][i]}"
    },
    layout: 'statline'

  # Slots.
  for slot_i in 1..5 do
    text str:
      data["slot#{slot_i}_location"].map.with_index { |x, i|
        unless x.to_s.strip.empty?
          "#{x} slot\n#{data["slot#{slot_i}_type"][i]}"
        end
      },
      layout: "bonus#{slot_i}"
   end

  save_png prefix: 'ship_', dir: '_output/ships'
  # TTS maximum size.
  save_sheet prefix: 'ship_sheet_', dir: '_output/tts', columns: 10, rows: 7
end