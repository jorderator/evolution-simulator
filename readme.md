# Evolution Simulator

This is a small evolution simulation I am working on as a personal curiosity and learning project.
The end goal is to have a system that will find the optimal entity properties for the given
scenario, through a form of natural selection.

## Current Features:

The features currently present in the project include:

* Random distribution of food across the available area, and additional food appearing as time passes
* Random generation of entities across the available area, with statistics randomised within set ranges
* Individual entity stats are represented as an RGB value used to draw that entity
* The initial range of entity statistics is able to be changed, both for testing throughout
   developement, and for later when the side menu is added
* Amount of food and the rate it appears at changes based on the window size, to prevent window
   size having more than one effect (the space the entities have), by making the food sparser or
   denser as well

## Planned Features:

These are the various ideas I have planned, including features I plan to work on soon, as well as 
ideas for potential features to be fleshed out and implemented later, and anywhere in between, in 
something of an order.

* Implementing entity behaviour, including several forms of movement, death, reproduction, etc
* Improve the food distribution system, to make it easier to modify, and have a better default
   setting
* Add a side menu that can be hidden and showed, that allows changing of properties like entity
   stat ranges, food distribution, etc
* More entity properties, including those governing more complex behaviours to be added later

(for now, the current and planned features lists are mostly to keep track of things for my own sake, 
but they will be changed to be more friendly once the project is more fleshed out)
