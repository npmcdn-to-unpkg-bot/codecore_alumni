class SkillsController < ApplicationController
  before_action :find_skill, only: [:edit, :update, :destroy]
  before_action :find_profile, only: [:edit, :update, :destroy]
  before_action :authenticate_user
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new skill_params
    @skill.profile = current_user_profile
    if @skill.save
      flash[:notice] = "Skillset created successfully"
      redirect_to edit_profile_path(current_user_profile, anchor: 'skills'), notice: "Skill has been created!"
    else
      flash.now[:alert] = "Skill wasn't created. Check errors below"
      redirect_to edit_profile_path(current_user_profile, anchor: 'skills'), alert: "Invalid input"
    end
  end

  def edit
  end

  def update
    if @skill.update skill_params
      redirect_to profile_path(@profile, anchor: 'skills'), notice: "Skill has been updated!"
    else
      flash.now[:alert] = "Skill could not be updated!"
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to profile_path(@profile, anchor: 'skills'), alert: "Skill has been removed!"
  end

  private

  def find_skill
    @skill = Skill.find params[:id]
  end

  def skill_params
    params.require(:skill).permit(:name, :category_id, :proficiency)
  end

  def user_from_request
    Profile.find_by_id(params[:profile_id]).user
  end

  def authorize_user
    if !(can? :manage, @skill) || !((user_from_request == current_user) || (current_user.admin))
      redirect_to root_path, alert: "ACCESS DENIED"
    end
  end

end
