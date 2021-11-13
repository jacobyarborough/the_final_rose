require 'rails_helper'

RSpec.describe 'bechelorette show page' do 
  before(:each) do 
    @b1 = Bachelorette.create!(name: 'Jane', season_number: 1, description: "best season ever")
    @c1 = @b1.contestants.create!(name: 'John', age: 21, hometown: 'New York, NY')
    @c2 = @b1.contestants.create!(name: 'James', age: 30, hometown: 'Denver, CO')
    @c3 = @b1.contestants.create!(name: 'Jacob', age: 35, hometown: 'Raleigh, NC')
    @o1 = Outing.create!(name: 'Pool Party', location: 'Los Angeles, CA', date: '07/12/2004')
    @o2 = Outing.create!(name: 'Dinner', location: 'San Francisco, CA', date: '06/14/2004')
    @c1.outings << @o1 
    @c2.outings << @o1
    @c2.outings << @o2
    @c3.outings << @o1
  end 
  it 'shows the associated attributes for a bachelorette' do 
    visit bacheloratte_path(@b1)

    expect(page).to have_content(@b1.name)
    expect(page).to have_content(@b1.season_number)
    expect(page).to have_content(@b1.description)
  end 

  it 'contains a link formatted as their name that routes to a page of contestants' do 
    visit bacheloratte_path(@b1)

    click_link "#{@b1.name}"

    expect(current_path).to eq()
  end 
end 