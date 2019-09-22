
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do   # ensures that seed data is piped into database in all-or-nothing fashion.  if an error occurs mid-seed, none of the data persists to the database.
  User.destroy_all
  jbenezry = User.create!(username: 'jbenezry')
  kkossally = User.create!(username: 'kkossally')
  oliver = User.create!(username: 'oliver')
  tarzan = User.create!(username: 'tarzan')

  Poll.destroy_all
  puppy_poll = Poll.create!(title: 'puppy_poll', user_id: jbenezry.id)
  kitty_poll = Poll.create!(title: 'kitty_poll', user_id: kkossally.id)

  Question.destroy_all
  puppy_love_question = Question.create!(text: 'How much do you loooooove puppies?', poll_id: puppy_poll.id)
  kitty_fluff_question = Question.create!(text: 'How fluffy is your cat?', poll_id: kitty_poll.id)

  AnswerChoice.destroy_all
  puppy_answer_1 = AnswerChoice.create!(text: 'A LOT', question_id: puppy_love_question.id)
  puppy_answer_2 = AnswerChoice.create!(text: 'Not at all!', question_id: puppy_love_question.id)
  kitty_answer_1 = AnswerChoice.create!(text: 'So much', question_id: kitty_fluff_question.id)
  kitty_answer_2 = AnswerChoice.create!(text: 'Flat as the Earth', question_id: kitty_fluff_question.id)

  Response.destroy_all
  oliver_response_1 = Response.create!(respondent_id: puppy_answer_1.id, answer_id: puppy_love_question.id)
  oliver_response_2 = Response.create!(respondent_id: kitty_answer_1.id, answer_id: kitty_fluff_question.id)
  tarzan_response_1 = Response.create!(respondent_id: puppy_answer_2.id, answer_id: puppy_love_question.id)
  tarzan_response_2 = Response.create!(respondent_id: kitty_answer_2.id, answer_id: kitty_fluff_question.id)
end