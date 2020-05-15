class ContestantsController < ApplicationController

  def index
    @contestants = Contestant.all
  end

  def new
  end

  def create
    @contestant = Contestant.create(contestant_params)
  end

  private
  def contestant_params
    params.permit(:contestant_id)
  end
end
