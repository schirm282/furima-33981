class RecordsController < ApplicationController

  def index
    @record_address = RecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @record_address = RecordAddress.new(record_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def record_params
    params.require(:record_address).permit(:postal_code, :delivery_source_area_id, :municipality, :house_number, :building, :phone_number, :record_id).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: record_params[:token],
      currency: 'jpy'
    )
  end
end
