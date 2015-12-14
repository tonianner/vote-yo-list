module API
  class UsersController < ApplicationController

    before_action :set_user

    def index
      render json: User.all
    end

    def show
      render json: @user
    end

    private
    def user_params
      params.require(:user).permit(:nickname, :email)
    end

    def set_user
      @user = User.find_by(id: params[:id])
    end

  end
end