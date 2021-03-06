class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    if current_user.id != @item.user_id || @item.order != nil
      redirect_to  action: :index
    else
      render :edit
    end

  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    unless current_user.id == @item.user_id
      redirect_to  action: :index
    else
      @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :product_category_id, :product_condition_id, :delivery_fee_id, :delivery_from_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end