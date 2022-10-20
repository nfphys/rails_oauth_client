class Oauth::CallbacksController < ApplicationController
  def index
    if params[:error]
      @error_message = params[:error]
      render 'oauth/callbacks/error'
      return
    end

    redirect_to root_path
  end
end
