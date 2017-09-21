class AddressesController < ApplicationController
  before_action :set_address

  def edit
    @states = State.active
    @countries = Country.list_of_countries
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to user_addresses_path, notice: I18n.t('address.update') }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to user_addresses_path, notice: I18n.t('address.destroy') }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:full_name, :address1, :address2, :city, :zipcode, :state_id, :country_id)
    end
end
