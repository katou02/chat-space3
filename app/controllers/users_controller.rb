class UsersController < ApplicationController
  def edit
  end

  def update
      if current_user.update(user_params)
          logger.debug("User Controller indexですよ")
          logger.debug(params)
          redirect_to root_path
      else
          render :edit
      end
  end

  private

  def user_params
      params.require(:user).permit(:name, :email)
  end
end
