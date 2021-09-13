# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "date" 

organiser1 = Organiser.create(name: "Ruby@Flatiron")
organiser2 = Organiser.create(name: "John Smith - Open University")
organiser3 = Organiser.create(name: "Women Who Code - London Chapter")

sponsor1 = Sponsor.create(name: "Flatiron")
sponsor2 = Sponsor.create(name: "Google")
sponsor3 = Sponsor.create(name: "Code First Girls")

Event.create([{
    name: "Ruby Codealong",
    location: "Flatiron London Offices",
    date: Date.parse("16th September 2021"),
    time: "18:00",
    organiser: organiser1,
    sponsor: sponsor1
  },
  {
    name: "Python - should everyone learn it?",
    location: "The Shard",
    date: Date.parse("13th November 2021"),
    time: "19:30",
    organiser: organiser2,
    sponsor: sponsor3
  },
  {
    name: "JavaScript vs. TypeScript",
    location: "Google - St Pancras Offices",
    date: Date.parse("25th September 2021"),
    time: "14:30",
    organiser: organiser1,
    sponsor: sponsor3
  },
  {
    name: "Have a bash at Bash",
    location: "WeWork - Oxford Street",
    date: Date.parse("19th September 2021"),
    time: "19:30",
    organiser: organiser2,
    sponsor: sponsor3
  },
  {
    name: "Women Who Code Introduction",
    location: "WeWork Moorgate",
    date: Date.parse("11th October 2021"),
    time: "13:00",
    organiser: organiser3,
    sponsor: sponsor3
}])
