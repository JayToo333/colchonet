class HomeController < ApplicationController
  def index
    @rooms = User.take(3)
  end
end
