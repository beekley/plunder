# Plunder

This is a card game where players upgrade and fight ships.

* Rules: [RULES.md](/RULES.md) and the cards can be built using the steps below.
* Play: [Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=2759806101).

## Architecture

This project has the following file architecture:

* `_output/` -- Directory where the built card images are saved. These files are not checked into the repository.
* `cardData/` -- Directory where the cards are are stored as `csv` files. I edit this via Google Sheets ([source](https://docs.google.com/spreadsheets/d/1SV8VB8KNjVy2acICk6ZNY3HaWjszx8Pu-WrdYQ5hsEM/edit?usp=sharing)).
* `src/` -- Directory where the card layout and building code is stored. The cards are generated using the Ruby libray, [`squib`](http://squib.readthedocs.io/).

## Getting Started

You should have at least Ruby 3 installed on your computer ([guide](https://www.ruby-lang.org/en/documentation/installation/)).

### Installation

From a terminal, run the following:

```
# Clone this repository from Github.
git clone https://github.com/beekley/untitled-card-game.git
# Install the packages and their dependencies from `Gemfile`.
bundle install
```

### Build Cards

From a terminal, run the following:

```
# Run the script in `Rakefile`.
rake
```

If you use VSCode, you can install the "Run on Save" extension to build cards whenever you make a change to a file.

\[this project is IARC-exempt due to being a card game.]
