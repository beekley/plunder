require 'squib'
require 'game_icons'

data = Squib.csv file: 'cardData/cardbacks.csv'

# Generate ship cards.
ship_fronts = Squib::Deck.new cards: data['title'].size, layout: 'src/cardback.yml' do
  # TODO: use dynamic colors.
  background color: 'black'
  rect layout: 'cut'
  rect layout: 'safe' 
  text str: "last built: #{Time.now}", layout: 'build'
  svg data: data['icon'].map{|x|
      GameIcons.get(x).string # .recolor(fg: '26495C', bg: 'E5E5DC')
    },
    layout: 'art'

  text str: data['title'], layout: 'title'

  save_png prefix: data['title'].map{|x|
      "cardback_#{x}_"
    }, dir: '_output/cardbacks'

  # Printable sheet backs.
  # TODO: update this file to have one back per card for duplex printing.
  # save_pdf prefix: 'item_print_', dir: '_output/print', rtl: true
end