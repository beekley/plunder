require 'squib'
require 'game_icons'

ship_data = Squib.csv file: 'cardData/items.csv'

# Generate item cards.
item_fronts = Squib::Deck.new cards: ship_data['title'].size, layout: 'src/ship.yml' do
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

  save_png prefix: 'item_', dir: '_output/items'
end