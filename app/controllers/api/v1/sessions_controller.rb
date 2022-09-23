class Api::V1::SessionsController < ApplicationController
  before_action :logged_in, only: [:show]

  def create
    user = User.find_by_email(user_params[:email])

    if user&.authenticate(user_params[:password])
      token = issue_token(user)
      render json: { user: UserSerializer.new(user), jwt: token }
    else
      render json: { error: 'Incorrect username or password.' }, status: :unauthorized
    end
  end

  def show
    render json: current_user, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
