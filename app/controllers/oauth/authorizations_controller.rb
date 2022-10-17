class Oauth::AuthorizationsController < ApplicationController
  def new
    uri = authorization_endpoint_uri
    redirect_to uri.to_s
  end

  private 

    def authorization_endpoint_uri
      query = URI.encode_www_form({
        response_type: 'code',
        scope: 'foo',
        client_id: 'oauth-client',
        redirect_uri: 'http://localhost:3000/oauth/callback',
        state: SecureRandom.urlsafe_base64,
      })
  
      uri = URI::HTTP.build({
        host: 'localhost',
        port: 3001,
        path: '/oauth/authorizations/new',
        query: query,
      })
    end    
end
