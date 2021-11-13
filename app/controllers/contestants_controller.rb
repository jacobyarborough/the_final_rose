class ContestantsController < ApplicationController
  def index 
    if params[:bachelorette_id]
      @contestants = Contestant.where(bachelorette_id: params[:bachelorette_id])
    else 
      @contestants = Contestant.all
    end
  end 
end 