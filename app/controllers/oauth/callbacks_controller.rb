class Oauth::CallbacksController < ApplicationController
  def index
    if params[:error]
      @error_message = params[:error]
      render 'oauth/callbacks/error'
      return
    end

    res = fetch_access_token
    puts ""
    puts "response body: #{res.body}"
    puts ""

    redirect_to root_path
  end

  private

    def fetch_access_token
      uri = URI.parse('http://localhost:3001/oauth/tokens')

      req = Net::HTTP::Post.new(uri.path)
      req['Content-Type'] = 'application/x-www-form-urlencoded'
      req.basic_auth 'oauth-client', 'secret'
      req.set_form_data({
        'grant_type' => 'authorization_code',
        'code' => params[:code],
        'redirect_uri' => oauth_callback_url
      })

      Net::HTTP.new(uri.host, uri.port).start { |http|
        http.request(req)
      }
    end
end
