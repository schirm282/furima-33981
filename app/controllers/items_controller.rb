class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :state_id, :category_id, :delivery_fee_id,
                                 :delivery_source_area_id, :days_to_delivery_id, :price).merge(user_id: current_user.id)
  end
end
