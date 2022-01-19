# Rules

* **Requirements**: 2-??? players
* **Duration**: ??? minutes

You are guardian spirits of the sea, and you have failed. Humans have made it past you and are exploiting the lands you swore to protect. With each tree they fell and stone they carve, spirits of the land are being stolen from their homes and taken back to wherever these humans come from. Redeem yourself and bring those spirits home.

**Objective**: Reclaim the land spirits from the humans and be the first to earn enough `spirit points`.

TODO: Replace with pirate theme.

## Components

There are 3 `ship` card decks, 1 `item` card deck, and 6 starting `spirit` cards.

### Ship Cards

These cards are split into decks that represent ships for a specific `region`, shown on the back side of the cards:

* Baylands ships
* Deepwater ships
* Swamp ships

The front-side of these cards shows their details, including:

* Which `slots` the ship has, including their `location` and `type`.
* Any abilities it has.
* Its `power`/`toughness`, before any items are added to it.

### Item cards

These cards represent items that can be used to outfit a ship. The front-side of these cards shows their details, including:

* In which `slot` it can be used (either in a `deck` slot of a ship, or a `hold` slot).
* Any abilities it has.
* How much `power`/`toughness` that this item adds to the ship.

The back-side shows in which `location` it can be used, and what `type` it is. If it displays multiple options, then it satisfies any of them.

## Setup

To set up the game:

1. Shuffle each of the ship region decks separately, and the item deck together.
1. Give each player one starting `spirit` card.

## How to Play

During the game, players take turns outfitting their ship and attacking other ships.

### Trade

At the beginning of their turn, a player can optionally trade cards in their hand:

1. Pick a deck, either the `item` deck or any `region` deck.
1. Reveal the top three cards of that deck.
1. Discard any number of cards from their hand and sum their total `value`.
1. Take any number of revealed cards with a total `value` less than or equal to **half** the total value of discarded cards.

### Outfitting a Ship

Next, a player must pick and outfit a ship:

1. Place a ship in front of the player. This can be the starting `spirit` card.
1. For each `deck` slot on the ship card, place up to one item that says `deck` above the ship card.
1. For each `hold` slot on the ship card, place up to one item that says `deck` below the ship card. Keep in mind that many items are "inactive" in the hold and cannot be used when attacking other ships.

### Attacking Other Ships

A player can find and attack another ship from one of the `region` decks:

1. Pick a `region` deck to attack.
1. Reveal the top three `ship` cards from the deck.
  - If there are no more cards in the deck, shuffle the discard pile for the `region` and draw from there.
1. Pick one of the `ship` cards to target, while discarding the rest.
1. For each `deck` slot on the targetted ship, search the `items` deck until they find a card that matches the `slot`'s `location` and `type`. Reveal the card and place it above the targetted ship.
1. For each `hold` slot on the targetted ship, search the `items` deck until they find a card that matches the `slot`'s `location` and `type`. Keep the card face down and place it below the targetting ship.
1. If the player wishes to attack, see the next section. Otherwise, discard each of the target ship's cards and their turn is over.

#### Which Ship Won?

Many cards have a `power`/`toughness` value in the bottom right corner. The winner of an attack is determined by a comparison of `power` and `toughness` after all items and abilities are counted. For each ship:

1. Read and follow the instructions for the abilities of each card, if present.
1. Sum all of the `power` values for the `ship` card and each of its `item` cards. This is the total `power` for the ship.
1. Sum all of the `toughness` values for the `ship` card and each of its `item` cards. This is the total `toughness` for the ship.

If the target ship's `power` is greater than the player ship's `toughness`, the player ship is destroyed. Discard all cards for the ship, except the `spirit` card if used.

If the player ship's `power` is greater than the target ship's `toughness`, the target ship is destroyed. The player may follow the [outfitting]() steps using any of the cards for either ship. Discard all other cards not used this way.

### End of the Game

Some cards have a `spirit point` value as part of their ability. The game ends when one player has outfitted a ship with 10 `spirit point`.

## Optional: Example Turn or Hand

TODO: give an example of an outfitted ship and calculate its power/toughness.

## Glossary

Definition of key terms (TODO: fill out):

* `ship`: 
    * `region`: 
    * `spirit`: 
* `item`: 
* `slots`: 
  * `location`: 
    * `deck`: 
    * `hold`: 
  * `type`: 
    * `common`: 
    * `military`: 
    * `arcane`: 
    * `exotic`: 
* `power`: 
* `toughness`: 
* `spirit point`: 