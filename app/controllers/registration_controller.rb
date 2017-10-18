class RegistrationController < Devise::RegistrationsController
  private
    def sign_up_params
      params.require(:user).permit(:username, :haveFiles, :location, :image, :email, :password, :password_confirmation)
    end

end
