class ListItemsController < ApplicationController
  def new
    @item_type_options = [["todo","TodoItem"], ["note","NoteItem"]]
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.new
  end
  def create
    @list = List.find(params[:list_id])
    @list_item = @list.list_items.new(list_item_params)
    if @list_item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @list_item = ListItem.find(params[:id])
  end

  def edit
    @list_item = ListItem.find(params[:id])
    @list = List.find(@list_item.list_id)
    @item_list_options = List.all.map{ |list| [list.title, list.id] }
  end
  def update
    if list_item_params[:checked]
      @list_item = TodoItem.find(params[:id])
      @list_item.checked = list_item_params[:checked]
      puts @list_item.checked
      puts "..........."
    else
      @list_item = ListItem.find(params[:id])
      @list_item.update(list_item_params)
    end


    if @list_item.save
      puts @list_item.checked
      puts "******"
      redirect_to root_path
    end
  end

  private
  def list_item_params
    params.require(:list_item).permit(:type, :content, :list_id, :checked)
  end
end
