# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Tag.create([
  { name: 'wi-fi' },
  { name: '電源' },
  { name: 'テラス' },
  { name: '喫煙OK' },
  { name: '夜9時以降OK' },
  { name: 'カウンター' },
  { name: '電源' },
  { name: 'テラス' },
  { name: '喫煙席' },
  { name: '夜9時以降OK' }
])