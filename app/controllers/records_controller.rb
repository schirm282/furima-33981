class RecordsController < ApplicationController

  def index
    @save = RecordAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    
  end
end
