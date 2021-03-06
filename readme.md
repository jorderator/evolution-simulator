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
* Basic entity behaviour, including targeting food if within range, and primitive wandering if not, 
   as well as food consumption, when they get close enough, reproducing if they have enough energy,
   and dying if they run out, leading to basic evolution!
* Basic time controls to allow for adjusting the speed of the simulation

## Planned Features:

These are the various ideas I have planned, including features I plan to work on soon, as well as 
ideas for potential features to be fleshed out and implemented later, and anywhere in between, in 
something of an order.

* Continue work on entity behaviour, such as,
* Bug fixes~ (the 'loop in gettable' crash is known btw, I am open to any suggestions to fix it)
* Improve the food distribution system, to make it easier to modify, and have a better default
   setting
* Improve the ease of changing stats, and make more properties easily changeable, to allow for 
   more options in the future side menu
* Add a side menu that can be hidden and showed, that allows changing of properties like entity
   stat ranges, food distribution, etc
* More entity properties, including those governing more complex behaviours to be added later
* Not really a feature, but add comments and stuff to the code, so it isn't just a mess of
   crazy

(for now, the current and planned features lists are mostly to keep track of things for my own sake, 
but they will be changed to be more friendly once the project is more fleshed out)
