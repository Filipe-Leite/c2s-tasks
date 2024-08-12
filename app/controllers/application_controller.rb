class ApplicationController < ActionController::API
  before_action :authenticate_user!

  def authenticate_user!

    token = request.headers['Authorization']&.split(' ')&.last

    if token && validate_token(token)
      true
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  private

  def validate_token(token)

    response = Faraday.get('http://127.0.0.1:3000/validate_token', {}, { 'Authorization' => "Bearer #{token}" })
    
    if response.status == 200
      # Se o token for válido, decodifique o payload
      @current_user = JSON.parse(response.body)["user"]
      true
    else
      false
    end
  end
end
