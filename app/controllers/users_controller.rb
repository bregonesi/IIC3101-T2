class UsersController < Users::RegistrationsController
  before_action :authenticate_user!, only: [:index, :destroy]

  # GET /user
  def index
  	if !user_signed_in?
  		redirect_to root_path
  	end
    @users = User.all.order('id')
  end

  # DELETE /user/:id
  def destroy
  	User.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to users_path }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end
end
