require 'squib'
require 'game_icons'

data = Squib.csv file: 'cardData/ships.csv'
fg_color = '333'
bg_color = 'FFF'

# Generate ship cards.
ship_fronts = Squib::Deck.new cards: data['title'].size, layout: 'src/ship.yml' do
  # Card layout.
  background color: 'white'
  text str: "last built: #{Time.now}", layout: 'build'
  svg data: data['icon'].map{|x|
      GameIcons.get(x).recolor(fg: fg_color, bg: bg_color).string
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
  #     "#{x}/#{data['toughness'][i].to_s}"
  #   },
  #   layout: 'statline'
  text str: data['value'], layout: 'value'
  svg data: GameIcons.get('shiny-purse').recolor(fg: fg_color, bg: bg_color).string, layout: 'value_icon'
  text str: data['power'], layout: 'power'
  svg data: GameIcons.get('pointy-sword').recolor(fg: fg_color, bg: bg_color).string, layout: 'power_icon'
  text str: data['toughness'], layout: 'toughness'
  svg data: GameIcons.get('crenulated-shield').recolor(fg: fg_color, bg: bg_color).string, layout: 'toughness_icon'

  # Slots.
  for slot_i in 1..5 do
    text str:
      data["slot#{slot_i}_location"].map.with_index { |x, i|
        unless x.to_s.strip.empty?
          location = x
          lcolor = 'black'
          if location == 'deck' then lcolor = 'brown' end
          type = data["slot#{slot_i}_type"][i]
          tcolor = 'black'
          if type == 'common' then tcolor = 'green' end
          if type == 'military' then tcolor = 'red' end
          if type == 'arcane' then tcolor = 'purple' end
          if type == 'exotic' then tcolor = 'orange' end
          "Slot:\n<span fgcolor=\"#{lcolor}\">#{location}</span>\n<span fgcolor=\"#{tcolor}\">#{type}</span>"
        end
      },
      markup: true,
      layout: "bonus#{slot_i}"
   end
   
  # Draw cut lines last so they're on top of other elements.
  rect layout: 'cut'
  rect layout: 'safe' 

  save_png prefix: 'ship_', dir: '_output/cards/ships'
  # Create a separate sheet for reach `realm` deck.
  realms = {}; data['realm'].each_with_index{ |t, i| (realms[t] ||= []) << i}
  realms.uniq.each{ |r|
    save_sheet prefix: "ship_#{r[0]}_sheet_",
      range: r[1],
      dir: '_output/sheets',
      # TTS maximum size.
      columns: 10,
      rows: 7
      
    # Printable sheet backs.
    save_pdf file: "ship_#{r[0]}_printable.pdf",
      range: r[1],
      dir: '_output/print',
      trim: 37.5
  }
end