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

  def update
    team = Team.find(params[:id])
    team.name = params[:name] if params[:name].present?
    team.description = params[:description] if params[:description].present?
    redirect_to teams_path if team.save
  end

  def destroy
    team = Team.find(params[:id])
    if team.destroy!
      redirect_to teams_path
    else
      render :show
    end
  end

  def new; end

  def create
    team = Team.new(name: params[:name], description: params[:description], owner_id: current_user.id)
    return unless team.save

    redirect_to teams_path
  end
end
