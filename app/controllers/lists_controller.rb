class ListsController < ApplicationController
  
  def index
  end
  
  def show
    @list = List.friendly.find params[:id]
  end
  
end