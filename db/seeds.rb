# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'visin', kind: '1', email:'visinmail', password: '**', name: 'javi',
surname: 'sinres',postalcode: '3433',country: 'españa',phone: '744747',photo: 'et')