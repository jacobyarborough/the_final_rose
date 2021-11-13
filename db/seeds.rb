# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

b1 = Bachelorette.create!(name: 'Jane', season_number: 1, description: "best season ever")
b2 = Bachelorette.create!(name: 'Julie', season_number: 2, description: "better season than last")

c1 = b1.contestants.create!(name: 'John', age: 21, hometown: 'New York, NY')
c2 = b1.contestants.create!(name: 'James', age: 30, hometown: 'Denver, CO')
c3 = b1.contestants.create!(name: 'Jacob', age: 35, hometown: 'Raleigh, NC')
c4 = b2.contestants.create!(name: 'Jerry', age: 25, hometown: 'Los Angeles, CA')
c5 = b2.contestants.create!(name: 'Jeremy', age: 27, hometown: 'San Diego, CA')
c6 = b2.contestants.create!(name: 'Jermaine', age: 31, hometown: 'Austin TX')

o1 = Outing.create!(name: 'Pool Party', location: 'Los Angeles, CA', date: '07/12/2004')
o2 = Outing.create!(name: 'Dinner', location: 'San Francisco, CA', date: '06/14/2004')
o3 = Outing.create!(name: 'Rodeo', location: 'Dallas, TX', date: '02/15/2005')
o4 = Outing.create!(name: 'Diving', location: 'Key West, FL', date: '08/19/2005')

c1.outings << o1 
c2.outings << o1
c2.outings << o2
c3.outings << o1

c4.outings << o3
c5.outings << o3
c6.outings << o4