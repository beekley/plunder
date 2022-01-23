require 'squib'
require 'game_icons'

data = Squib.csv file: 'cardData/items.csv'
fg_color = '333'
bg_color = 'FFF'

# Generate item cards.
item_fronts = Squib::Deck.new cards: data.nrows, layout: 'src/ship.yml' do
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
  # TODO Figure out where to put this. Flavor text is lower priority than functional text.
  # text str: data['description'], layout: 'description'
  # text str: data['value'].map.with_index { |x, i|
  #     if x != "" then "Value: #{x}g" end
  #   },
  #   layout: 'value'
  # We have to use `map` here to combine the "power" column with the "toughness" column.
  # text str: data['power'].map.with_index { |x, i|
  #     # "power/toughness".
  #     "#{x}/#{data['toughness'][i]}"
  #   },
  #   layout: 'statline'
  text str: data['value'], layout: 'value'
  svg data: GameIcons.get('shiny-purse').recolor(fg: fg_color, bg: bg_color).string, layout: 'value_icon'
  text str: data['power'], layout: 'power'
  svg data: GameIcons.get('pointy-sword').recolor(fg: fg_color, bg: bg_color).string, layout: 'power_icon'
  text str: data['toughness'], layout: 'toughness'
  svg data: GameIcons.get('crenulated-shield').recolor(fg: fg_color, bg: bg_color).string, layout: 'toughness_icon'

  # Slots.
  text str: data['deck'].map { |x|
      if x == 'x'
        'deck'
      end
    },
    layout: 'bonus1', color: :brown
  # Types.
  text str: data['common'].map { |x|
      unless x.empty?
        'common'
      end
    },
    layout: 'bonus2', color: :green
  text str: data['military'].map { |x|
      unless x.empty?
        'military'
      end
    },
    layout: 'bonus3', color: :red
  text str: data['arcane'].map { |x|
      unless x.empty?
        'arcane'
      end
    },
    layout: 'bonus4', color: :purple
  text str: data['exotic'].map { |x|
      unless x.empty?
        "exotic"
      end
    },
    layout: 'bonus5', color: :orange

  # TODO: break these out to a helper function and separate by rake command.
  save_png prefix: 'item_', dir: '_output/cards/items'
  # TTS maximum size.
  save_sheet prefix: 'item_sheet_', dir: '_output/sheets', columns: 10, rows: 7
  # Printable sheet fronts.
  save_pdf file: "item_printable.pdf",
      dir: '_output/print',
      trim: 37.5
end