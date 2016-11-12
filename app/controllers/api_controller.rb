class ApiController < ActionController::Base

  # skip_before_action :verify_authenticity_token
  before_action :enabled_cors


  private

    def enabled_cors
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport, X-Remote, api_key, auth_token, *'
      headers['Access-Control-Request-Method'] = 'GET, POST, PUT, DELETE'
      headers['Access-Control-Request-Headers'] = 'Origin, X-Atmosphere-tracking-id, X-Atmosphere-Framework, X-Cache-Date, Content-Type, X-Atmosphere-Transport,  X-Remote, api_key, *'
    end

end