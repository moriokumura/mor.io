class ListItemsController < ApplicationController
  
  before_action :set_list_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:edit, :update, :destroy]
  
  def new
    @list_item = ListItem.new
  end
  
  def edit
  end
  
  def update
    if @list_item.update(list_item_params)
      redirect_to @list_item.list
    else
      render :edit
    end
  end
  
  private
  
    def set_list_item
      @list_item = ListItem.find params[:id]
    end
    
    def list_item_params
      params.require(:list_item).permit(:title, :subtitle, :description)
    end
    
    def authenticate_owner!
      unless current_user.try(:id) == @list_item.list.user_id
        render text: :unauthorized, status: :unauthorized
      end
    end
  
end