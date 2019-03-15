class ApplicationController < ActionController::API
  include JWTSessions::RailsAuthorization
  rescue_from JWTSessions::Errors::Unauthorized, with: :not_authorised

  private

  def current_user
    @current_user ||= User.find(payload['user_id'])
  end

  def not_authorised
    render json: { error: 'Not Authorised' }, status: :unauthorized
  end
end
