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
    ActiveRecord::Base.transaction do
      @list_item.update!(list_item_params)
      params[:attribute_items].each do |id, hash|
        item = @list_item.attribute_items.find hash[:id]
        item.title = hash[:title]
        item.body = hash[:body]
        item.save!
      end if params[:attribute_items].present?
    end
    redirect_to list_path(@list_item.list, anchor: "list-item-#{@list_item.id}")
  rescue => e
    render :edit
  end
  
  private
  
    def set_list_item
      @list_item = ListItem.find params[:id]
    end
    
    def list_item_params
      params.require(:list_item).permit(:title, :subtitle, :description)
    end
    
    def authenticate_owner!
      unless @list_item.owned?(current_user)
        render text: :unauthorized, status: :unauthorized
      end
    end
  
end