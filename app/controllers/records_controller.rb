class RecordsController < ApplicationController

  def index
    @record_address = RecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def record_params
    params.permit(:postal_code, :delivery_source_area_id, :municipality, :house_number, :building, :phone_number, :record_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
