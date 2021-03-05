class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
 
  def index
   @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
       redirect_to root_path
    end
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    # binding.pry
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:posral_code, :area_id, :municipalities, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end



end

