class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :new, :create, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def edit
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    redirect_to root_path if @item.destroy
  end

  private

  def move_to_index
    @item = Item.find(params[:id])
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def item_params
    params.require(:item).permit(:name, :explanation, :image, :state_id, :category_id, :delivery_fee_id,
                                 :delivery_source_area_id, :days_to_delivery_id, :price).merge(user_id: current_user.id)
  end
end
