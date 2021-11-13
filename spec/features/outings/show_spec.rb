require 'rails_helper'

RSpec.describe 'outings show page' do 
  before(:each) do 
    @b1 = Bachelorette.create!(name: 'Jane', season_number: 1, description: "best season ever")
    @c1 = @b1.contestants.create!(name: 'John', age: 21, hometown: 'New York, NY')
    @c2 = @b1.contestants.create!(name: 'James', age: 30, hometown: 'Denver, CO')
    @c3 = @b1.contestants.create!(name: 'Jacob', age: 35, hometown: 'Raleigh, NC')
    @o1 = Outing.create!(name: 'Pool Party', location: 'Los Angeles, CA', date: '07/12/2004')
    @c1.outings << @o1 
    @c2.outings << @o1
    @c3.outings << @o1 

    visit outing_path(@o1)
  end 

  it 'has all associated outing attriutes displayed' do 
    expect(page).to have_content(@o1.name)
    expect(page).to have_content(@o1.location)
    expect(page).to have_content(@o1.date)
  end 

  it 'shows the total count of contestants and their names' do 
    expect(page).to have_content("Number of Contestants: 3")
    expect(page).to have_content(@c1.name)
    expect(page).to have_content(@c2.name)
    expect(page).to have_content(@c3.name)
  end 
end  