require 'rails_helper'

RSpec.describe 'contestants index page' do 
  before(:each) do 
    @b1 = Bachelorette.create!(name: 'Jane', season_number: 1, description: "best season ever")
    @c1 = @b1.contestants.create!(name: 'John', age: 21, hometown: 'New York, NY')
    @c2 = @b1.contestants.create!(name: 'James', age: 30, hometown: 'Denver, CO')
    @c3 = @b1.contestants.create!(name: 'Jacob', age: 35, hometown: 'Denver, CO')
    @o1 = Outing.create!(name: 'Pool Party', location: 'Los Angeles, CA', date: '07/12/2004')
    @o2 = Outing.create!(name: 'Dinner', location: 'San Francisco, CA', date: '06/14/2004')
    @c1.outings << @o1 
    @c2.outings << @o1
    @c2.outings << @o2
    @c3.outings << @o1

    visit bachelorette_contestants_path(@b1)
  end 

  it 'has the attributes of each contestant listed on the page' do
    expect(page).to have_content(@c1.name)
    expect(page).to have_content(@c1.age)
    expect(page).to have_content(@c1.hometown)
    expect(page).to have_content(@c2.name)
    expect(page).to have_content(@c2.age)
    expect(page).to have_content(@c2.hometown)
    expect(page).to have_content(@c3.name)
    expect(page).to have_content(@c3.age)
  end 

  it 'contains a link to each contestants show page' do 
    click_on "#{@c1.name}"

    expect(current_path).to eq(bachelorette_contestant_path(@b1, @c1))
  end 

  it 'shows a uniqe list of contestant hometowns' do 
    within("#home-town") do 
    expect(page).to have_content(@c1.hometown)
    expect(page).to have_content(@c2.hometown, count: 1)
    expect(page).to have_content(@c3.hometown, count: 1)
    end 
  end 
end  