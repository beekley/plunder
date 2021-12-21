require 'squib'

ship_data = Squib.csv file: 'cardData/ships.csv'

# Generate ship cards.
Squib::Deck.new cards: ship_data['title'].size, layout: 'src/ship.yml' do
  # Card layout.
  background color: 'white'
  rect layout: 'cut' # cut line as defined by TheGameCrafter
  rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: "last built: #{Time.now}", layout: 'build'

  # Descriptive elements.
  text str: ship_data['title'], layout: 'title'
  text str: ship_data['description'], layout: 'description'
  # We have to use `map` here to combine the "power" column with the "toughness" column.
  # The result is `power/toughness`. There might be an easier way to do this.
  text str: ship_data['power'].map.with_index{ |x, i| "#{x}/#{ship_data['toughness'][i]}" },
    layout: 'snark'

  # Slots.
  text str:
    ship_data['slot1_location'].map.with_index{ |x, i| "#{x}\n#{ship_data['slot1_type'][i]}" },
    layout: 'bonus1'

  save_png
end