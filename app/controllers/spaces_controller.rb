class SpacesController < ApplicationController
  before_action :set_space, only: [:show]
  
  def index
    @spaces = Space.all
  end
  
  def show
    @spaces = @user.spaces
  end

  private

  def set_space
    @user = User.find(params[:id])
  end
end
