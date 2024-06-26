class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_paams)
    if @item.save
      redirect_to item_path(@item), notice: "You have created item successfully."
    else
      @items = Item.all
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "You have updated item successfully."
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, "You have deleted item successfully."
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :name, :introduction, :item_image, :price, :is_active)
  end

end
