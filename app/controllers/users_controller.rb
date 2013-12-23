class UsersController < ApplicationController
  def show
    @user = current_user
    @bubble_color = @user.bubble_color
    render layout: false
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes update_user_params
      render text: '更新成功'
    else
      render text: @user.errors.full_messages.join('<br />'), status: 400
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      auto_login @user
      redirect_to root_url
    else
      render :new
    end
  end
end
