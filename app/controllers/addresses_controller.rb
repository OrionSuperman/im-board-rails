class AddressesController < ApplicationController
  def create
    address = Address.new(address_params)
    if address.valid?
      address.save
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = address.errors.full_messages
      redirect_to "/users/#{session[:user_id]}/edit"
    end
  end

  def new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def show
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    if address.valid?
      address.save
      redirect_to "/users/#{session[:user_id]}"
    else
      flash[:errors] = address.errors.full_messages
      redirect_to "/addresses/#{address.id}/edit"
    end
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:street1, :user_id, :street2, :city, :state, :zipcode, :lat, :lng)
  end
end
