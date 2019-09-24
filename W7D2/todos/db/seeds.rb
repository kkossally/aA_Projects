# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Todo.destroy_all

t1 = Todo.create!(
  title: "Write Game of Thrones", 
  body: "Spoiler, he dies.",
  done: false
)

t2 = Todo.create!(
  title: "Cry in the shower", 
  body: "If Drake can do it, so can I!",
  done: false
)

t3 = Todo.create!(
  title: "Delete Facebook, Insta, and Twitter", 
  body: "...as soon as I'm done hate-liking my exe's vacay pics.",
  done: false
)

t4 = Todo.create!(
  title: "Start cooking again", 
  body: "PB&J is cooking, right?",
  done: false
)

t5 = Todo.create!(
  title: "Go to college!", 
  body: "JK, it's a scam!",
  done: false
)