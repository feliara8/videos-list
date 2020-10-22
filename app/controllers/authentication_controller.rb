# handle api auth requests
class AuthenticationController < ApplicationController
  protect_from_forgery with: :null_session

  def signin
    @result = AuthenticationRequests.new.signin(signin_params[:user], signin_params[:password])
  end

  def signin_params
    params.permit(:user, :password)
  end
end
