require 'rails_helper'

RSpec.describe Contestant, type: :model do
  describe 'relationships' do
    it {should belong_to :bachelorette}
    it {should have_many :contestant_outings}
    it {should have_many(:outings).through(:contestant_outings)}
  end

  describe 'class methods' do 
    before(:each) do 
      @b1 = Bachelorette.create!(name: 'Jane', season_number: 1, description: "best season ever")
      @c1 = @b1.contestants.create!(name: 'John', age: 21, hometown: 'New York, NY')
      @c2 = @b1.contestants.create!(name: 'James', age: 30, hometown: 'Denver, CO')
      @c3 = @b1.contestants.create!(name: 'Jacob', age: 35, hometown: 'Denver, CO')
    end 

    describe '.hometowns' do 
      it 'returns a unique list of contestant hometowns for a certain season' do 
        expect(Contestant.hometowns(@b1.id)).to eq([@c2.hometown, @c1.hometown])
      end 
    end 
  end 
end
