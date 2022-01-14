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
      "#{x}/#{data['toughness'][i].to_s}"
    },
    layout: 'statline'

  # Slots.
  for slot_i in 1..5 do
    text str:
      data["slot#{slot_i}_location"].map.with_index { |x, i|
        unless x.to_s.strip.empty?
          location = x
          type = data["slot#{slot_i}_type"][i]
          color = 'black'
          if type == 'common' then color = 'green' end
          if type == 'military' then color = 'red' end
          if type == 'arcane' then color = 'purple' end
          if type == 'exotic' then color = 'orange' end
          "#{location} slot\n<span fgcolor=\"#{color}\">#{type}</span>"
        end
      },
      markup: true,
      layout: "bonus#{slot_i}"
   end

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
  }
end