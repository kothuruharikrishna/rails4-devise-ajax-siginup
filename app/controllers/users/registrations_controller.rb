class Users::RegistrationsController < Devise::RegistrationsController
 #respond_to :html, :js
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        sign_in(@user)
        format.html
        format.js
      else
        format.html { render :action => "new" }
        #format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
        format.js
      end
    end 
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
