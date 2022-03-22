class SpacesController < ApplicationController

  def index
    @spaces = Space.all
    @users = User.all
  end
end
