class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def authenticate_user!

    token = request.headers['Authorization']&.split(' ')&.last

    if token && validate_token(token)

      return @current_user
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def validate_token(token)

    response = Faraday.get('http://127.0.0.1:3000/auth/validate_token', {}, { 'Authorization' => "Bearer #{token}" })
    
    if response.status == 200
      
      return @current_user = JSON.parse(response.body).transform_keys(&:to_sym)
    else
      false
    end
  end
end
