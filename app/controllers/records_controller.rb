class RecordsController < ApplicationController

  def index
    @save = Save.new
  end

  def create
    binding.pry
  end
end
