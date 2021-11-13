require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'instance methods' do 
    before(:each) do 
      @b1 = Bachelorette.create!(name: 'Jane', season_number: 1, description: "best season ever")
      @c1 = @b1.contestants.create!(name: 'John', age: 21, hometown: 'New York, NY')
      @c2 = @b1.contestants.create!(name: 'James', age: 30, hometown: 'Denver, CO')
      @c3 = @b1.contestants.create!(name: 'Jacob', age: 35, hometown: 'Raleigh, NC')
    end 

    describe '#avg_contestant_age' do 
      it 'calculates the average age for contestants on that season' do 
        expect(@b1.avg_contestant_age).to eq(28.67)
      end 
    end 
  end 
end
