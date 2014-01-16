class UserController < ApplicationController
  def profile

  	#validar login
  	if user_signed_in?
  		#pegar dados do usuario logado

  	@name = current_user.name

  	@user = current_user	



  	else
  		
  		redirect_to new_user_session_path

  	end

  end



  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to :controller => 'user', :action => 'profile'
    else
      render "edit"
    end
  end


   def user_params
    # NOTE: Using `strong_parameters` gem
    params.required(:user).permit(:password, :password_confirmation)
  end



end
