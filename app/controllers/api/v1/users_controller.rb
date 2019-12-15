module Api
module V1
  class UsersController < ApplicationController
    def index
      @users = User.order('created_at DESC')
      render json: @users
    end

    def new
      @user = User.new
    end

    def show
      render json: User.find(params[:id])
    end

    def create
      user = User.new(user_params)
      user.kind = 2
      if user.save
        if session[:pablo] != 1
          render json: { status: 'SUCCESS', message:'user saved successfully', data: user }, status: :created
        else
          #redirect_to admin_index_path
          render json:{ hola: session }, status: :ok
        end
      else
        render json: { status: 'ERROR', message: 'user not created', data: user.errors }, status: :unprocessable_entity
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      render json: { status: 'SUCCESS', message: 'User deleted', data: user }, status: :ok
    end

    def update
      user = User.find(params[:id])
      if user.update_attributes(user_params)
        render json: {status: 'SUCCESS', message:'user updated', data:user},status: :ok
      else
        render json: {status: 'ERROR', message:'user not updated', data:user.errors},status: :bad_request
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :surname, :username, :email, :password, :kind, :country, :postalcode, :phone)
    end
  end
end
end
