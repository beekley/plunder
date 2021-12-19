# untitled-card-game

This is an untitled (paper) card game where players upgrade and fight ships. The rules are found in [RULES.md](/RULES.md) and the cards can be generated using the steps below.

## Architecture

This project has the following file architecture:

* `_output/` -- Directory where the card images are generated. These files are not checked into the repository.
* `cardData/` -- Directory where the cards are are stored as `csv` files. I edit this via Google Sheets ([source](https://docs.google.com/spreadsheets/d/1SV8VB8KNjVy2acICk6ZNY3HaWjszx8Pu-WrdYQ5hsEM/edit?usp=sharing)).
* `src/` -- Directory where the card layout and generation code is stored. The cards are generated using the Ruby libray, [`squib`](http://squib.readthedocs.io/).

## Getting Started

You should have at least Ruby 3 installed on your computer ([guide](https://www.ruby-lang.org/en/documentation/installation/)).

### Installation

From a terminal, run the following:

```
# Installs the packages and their dependencies from `Gemfile`.
bundle install
```

### Generating Cards

From a terminal, run the following:

```
# Runs the script in `Rakefile`.
rake
```

## TODO

* Complete one full set of cards.
* Write documentation.
* Set up pipline to Tabletop Simulator.
* Come up with title.