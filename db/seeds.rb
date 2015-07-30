# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

facts = Fact.create([
  { content: "The first diner was created in 1872, by a man named Walter Scott. He decided to sell food out of a horse-pulled wagon to employees of the Providence Journal, in Providence, Rhode Island. Scott's diner can be considered the first diner with “walk up” windows that were located on each side of the wagon.\n(Source: http://www.factslides.com)" }, 
  { content: "An average person in the U.S. eats 35 tons of food in a lifetime. \n(Source: http://www.factslides.com)" },
  { content: "Fortune cookies are not a traditional Chinese custom. They were invented in early 1900 in San Francisco. \n(Source: http://www.factslides.com)" },
  { content: "Airplane food isn't very tasty because our sense of smell and taste decrease from 20 to 50 percent. \n(Source: http://www.factslides.com)"},
  { content: "Even thinking about a favorite food triggered release of dopamine, a feel-good hormone also produced during sex and drug use. \n(Source: http://www.factslides.com)" },
  { content: "49% of U.S. Adults eat one sandwich a day. \n(Source: http://www.factslides.com)" },
  { content: "The jars of Nutella sold in a year could cover The Great Wall of China 8 times. \n(Source: http://www.factslides.com)" },
  { content: "Most wasabi consumed is not real wasabi, but colored horseradish. \n(Source: Buzzfeed)" },
  { content: "Oklahoma’s state vegetable is the watermelon. \n(Source: Buzzfeed)" },
  { content: "One of the most popular pizza toppings in Brazil is green peas. \n(Source: Buzzfeed)" },
  { content: "The most expensive pizza in the world costs $12,000 and takes 72 hours to make. \n(Source: Buzzfeed)" },
  { content: "The Dunkin’ Donuts in South Korea offer doughnut flavors such as Kimchi Croquette and Glazed Garlic. \n(Source: Buzzfeed)" },
  { content: "There is an amusement park in Tokyo that offers Raw Horse Flesh-flavored ice cream. \n(Source: Buzzfeed)" },
  { content: "One fast food hamburger may contain meat from 100 different cows. \n(Source: Buzzfeed)" },
  { content: "Chuck E. Cheese pizza restaurants were created by the inventor of the Atari video game system, Nolan Bushnell. \n(Source: Buzzfeed)" },
  { content: "The popsicle was invented by an 11-year-old in 1905. \n(Source: Buzzfeed)" }
])

