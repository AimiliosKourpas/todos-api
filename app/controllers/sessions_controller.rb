class SessionsController < ApplicationController
    def logout
      if current_user_authenticated?
        render json: { message: 'Logout successful' }, status: :ok
      else
        render json: { message: 'Missing token' }, status: :unprocessable_entity
      end
    end
  
    private
  
    def current_user_authenticated?
      headers['Authorization'].nil?
    end
  end