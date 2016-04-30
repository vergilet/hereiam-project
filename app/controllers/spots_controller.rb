class SpotsController < ApplicationController
  def show
    @messages = Message.all
  end
end
