# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

iris = User.create(first_name: 'Iris', last_name: 'Dan', email: 'dani@bc.edu', password: 'bc2015rocks', password_confirmation: 'bc2015rocks', role: 'admin')
gordon = User.create(first_name: 'Gordon', last_name: 'Eagle', email: 'eagleg@bc.edu', password: 'bc2015rocks', password_confirmation: 'bc2015rocks', role: 'coach')