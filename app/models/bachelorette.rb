class Bachelorette <ApplicationRecord
  has_many :contestants
  
  def avg_contestant_age
    contestants.average(:age).round(2).to_f
  end 
end
