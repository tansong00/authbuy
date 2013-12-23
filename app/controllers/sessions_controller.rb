class SessionsController < ApplicationController

  def new
    render layout: false
  end

  def create
    user = login(params[:username], params[:password])
    if user
      redirect_to root_path
    else
      render layout: false
    end
  end
end
