class RoomsController < ApplicationController
  def show
    @rooms = Room.take(3)
  end
end
