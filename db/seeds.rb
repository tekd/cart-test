# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create({{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

items = {price: 25.99, name: "Dog Food"}, {price:15.99, name:"Cat Food"}

items.each {|item| Product.create(name:item[:name],price:item[:price])}

order_costs =  {destination: 12151, cost: 25.25},{destination: 56211, cost: 12.25},
 {destination: 23569,cost: 32.25 }

order_costs.each {|oc|OrderCost.create(destination:oc[:destination], cost:oc[:cost])}

cart = Cart.create