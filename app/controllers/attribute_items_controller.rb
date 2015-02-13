class AttributeItemsController < ApplicationController
  
  before_action :set_attribute_item, only: [:show, :edit, :update, :destroy]
  before_action :set_target, only: [:new, :create]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_owner!, only: [:edit, :update, :destroy]
  
  def new
    @attribute_item = AttributeItem.new
    @url = polymorphic_path([@target, AttributeItem])
  end
  
  def create
    @attribute_item = AttributeItem.new(attribute_item_params)
    @attribute_item.target = @target
    @attribute_item.save!
    redirect_to list_path(@attribute_item.target.list, anchor: "list-item-#{@attribute_item.target_id}")
  rescue => e
    render :new
  end
  
  def edit
  end
  
  def update
    @attribute_item.update!(attribute_item_params)
    redirect_to list_path(@attribute_item.target.list, anchor: "list-item-#{@attribute_item.target_id}")
  rescue => e
    render :edit
  end
  
  private
  
    def set_attribute_item
      @attribute_item = AttributeItem.find params[:id]
    end
  
    def set_target
      @target = ListItem.find params[:list_item_id]
    end
    
    def attribute_item_params
      params.require(:attribute_item).permit(:title, :body)
    end
    
    def authenticate_owner!
      unless @attribute_item.owned?(current_user)
        render text: :unauthorized, status: :unauthorized
      end
    end
  
end