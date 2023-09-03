class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
end 


private

def item_params
  params.require(:item).permit(:image, :product_name, :description, :selling_price, :genre_id, :genre_status_id, :genre_shipping_cost_id, :genre_prefecture_id, :genre_shipping_day_id).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end