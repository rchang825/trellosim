class ListsController < ApplicationController
  def new
    @list = List.new
  end
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to "/"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  private
  def list_params
    params.require(:list).permit(:title)
  end
end
