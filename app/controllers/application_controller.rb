class ApplicationController < ActionController::Base
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'mitalin' && password == '1210'
    end
  end
end
