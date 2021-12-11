require 'squib'

data = Squib.csv file: 'data.csv'

Squib::Deck.new cards: data['name'].size, layout: 'economy.yml' do
  background color: 'white'
  rect layout: 'cut' # cut line as defined by TheGameCrafter
  rect layout: 'safe' # safe zone as defined by TheGameCrafter
  text str: data['name'], layout: 'title'
  text str: data['power'], layout: 'description'
  save_png
end