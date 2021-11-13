class Contestant <ApplicationRecord
  belongs_to :bachelorette
  has_many :contestant_outings
  has_many :outings, through: :contestant_outings

  def self.hometowns(bach_id)
    select('distinct contestants.hometown').where(bachelorette_id: bach_id).map do |contestant|
      contestant[:hometown]
    end 
  end 
end
