require 'rails_helper'

RSpec.describe 'contestant show page' do 
  before(:each) do 
    @b1 = Bachelorette.create!(name: 'Jane', season_number: 1, description: "best season ever")
    @c1 = @b1.contestants.create!(name: 'John', age: 21, hometown: 'New York, NY')
    @o1 = Outing.create!(name: 'Pool Party', location: 'Los Angeles, CA', date: '07/12/2004')
    @o2 = Outing.create!(name: 'Dinner', location: 'San Francisco, CA', date: '06/14/2004')
    @c1.outings << @o1
    @c1.outings << @o2

    visit bachelorette_contestant_path(@b1,@c1)
  end 

  it 'shows the name of the contestant' do 
    expect(page).to have_content(@c1.name)
  end 

  it 'shows the season number and description' do 
    expect(page).to have_content("Season: 1")
    expect(page).to have_content("best season ever")
  end 

  it 'shows the associated outings' do 
    expect(page).to have_content(@o1.name)
    expect(page).to have_content(@o2.name)
  end 

  it 'contains a link to each outing' do 
    click_on "#{@o1.name}" 

    expect(current_path).to eq(outing_path(@o1))
  end 
end 