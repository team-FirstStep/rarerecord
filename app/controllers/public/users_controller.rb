class Public::UsersController < Public::ApplicationController
  # before_action :set_user

  def show
    @user = User.find(params[:id])
    @addresses = @user.addresses
  end

  def edit
    @user = User.find(params[:id])
    @add_address = Address.new
    @user.addresses.build
    @edit_address = Address.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @edit_address.update(address_params)
    redirect_to user_path(current_user)
  end

  def create
    @new_address = Address.new(user_params)
    @new_address.save
    redirect_to user_path(current_user)
  end

private
	def user_params
		params.require(:user).permit(:last_name, :first_name, :last_name_kana,
			:first_name_kana, :email, :profile_image, :zip, :address,
			addresses_attributes: [:id, :add_last_name, :add_first_name, :add_last_name_kana, :add_first_name_kana,
      :address, :phone, :zip, :_destroy])
	end
  def address_params
    params.require(:address).permit(:add_last_name, :add_first_name, :add_last_name_kana, :add_first_name_kana,
      :add_address, :phone, :add_zip)
  end

end