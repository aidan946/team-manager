class TeamsController < ApplicationController
  def index
    @teams = Team.where(owner_id: current_user.id)
  end

  def show
    @team = Team.find(params[:id])
  end

  def edit
    @team = Team.find(params[:id])
  end

  def new; end

  def create
    team = Team.new(name: params[:name], description: params[:description], owner_id: current_user.id)
    return unless team.save

    redirect_to teams_path
  end
end
