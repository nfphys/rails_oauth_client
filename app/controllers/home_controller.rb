class HomeController < ApplicationController
  def index
    @authorization_endpoint = authorization_endpoint
  end

  private 

    def authorization_endpoint
      query = URI.encode_www_form({
        response_type: 'code',
        scope: 'foo',
        client_id: 'oauth-client',
        redirect_uri: 'http://localhost:3000/callback',
        state: SecureRandom.urlsafe_base64,
      })

      URI::HTTP.build({
        host: 'localhost',
        port: 3001,
        path: '/oauth/authorizations/new',
        query: query,
      }).to_s
    end
end
