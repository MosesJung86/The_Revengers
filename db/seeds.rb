require 'faker'

20.times {

User.create!(username: Faker::Internet.user_name, password: Faker::Internet.password(8))
};

mickey = User.create!(username: 'Mickey', password: 123)
minnie = User.create!(username: 'Minnie', password: 123)
daffy = User.create!(username: 'Daffy', password: 123)
goku = User.create!(username: 'Goku', password: 123)


q1 = mickey.questions.create!(title: 'What cookie is the healthiest?',description: "I\'m on a diet and wondering which cookie is good for you.")

q2 = goku.questions.create!(title: 'Can cookies fly?', description: "Seriously.....can they?")

q3 = daffy.questions.create!(title: 'What do to when girlfriend breaks up with you for the cookie monster?', description: 'Super pissed that she did that. I thought she really liked me. sadface.')

a1 = q1.answers.create!(description: "gluten-free kale cookies")
a2 = q2.answers.create!(description: "They do. I've seen one back in Kansas.")
a3 = q2.answers.create!(description: "You idiot. Of course they can.")
a4 = q2.answers.create!(description: "Yup.")
a5 = q3.answers.create!(description: "I think you are cute. Want to go on a date?")
a6 = q3.answers.create!(description: "No worries, plenty of fish in the sea.")
