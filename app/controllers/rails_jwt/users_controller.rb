require_dependency "rails_jwt/application_controller"

module RailsJwt
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    include JwtSetup
    # gem 'rails_jwt', path:'/Users/ispirett/RubymineProjects/engines/rails_jwt'

    def create
      @user = User.new(user_params)
      if @user.save
        token = encode(user_id: @user.id)
        # refactor to allow users to configure
        time =  Time.now +  1.week.from_now.to_i
        render json: {status: 'success', token: token,user: @user, exp: time.strftime('%m %d %y %H:%M')}, status: :ok
      else
        render json: {status: :failed, msg: @user.errors.full_messages}, status: :unauthorized
      end
    end

    def sign_in
      @user = User.find_by(email: params[:email].downcase)
      if @user&.authenticate(params[:password])
        #=> create new token from JwtAuth
        token = encode(user_id: @user.id)
        time = Time.now + 1.week.from_now.to_i

        #=> create or update user to jwt model
        if @logged_user = Jwt.find_by(user_id: @user.id)
          @logged_user.update_attribute(:token, token)
        else
          Jwt.create(user_id: @user.id, token: token)
        end

        render json: {status: :success,user: @user, token:token, exp: time.strftime('%m-%d-%y %H:%M')},status: :ok
      else
        render json: {status: :failed, msg: 'email or password is incorrect'}, status: :unauthorized
      end
    end



    private
    def refresh_token
      header = request.headers[:AuthToken]
      render json: {status: :success, refresh_token: refresh_jwt_user(header)}
    end

    def user_params
      params.require(:user).permit(:email,:password )
    end
  end




end

