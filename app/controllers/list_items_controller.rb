class ListItemsController < ApplicationController
  def new
    @item_type_options = ["todo", "note"]
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.new
  end
  def create
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.new(list_item_params)
    if @list_item.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @list_item = ListItem.find(params[:id])
  end

  private
  def list_item_params
    params.require(:list_item).permit(:item_type, :content, :list_id)
  end
end
