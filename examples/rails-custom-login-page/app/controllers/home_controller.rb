class HomeController < ApplicationController
  def index
    redirect_to "/dashboard" if session["user"]
  end
end
