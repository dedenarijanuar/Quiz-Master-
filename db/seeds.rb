# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

questions = [
	{content: "10 x 10 = ?", answer: 100},
	{content: "How many letters are there in the English alphabet?", answer: 26},
	{content: 'the capital city of indonesia is?', answer: 'jakarta'}
]

Question.create(questions)
