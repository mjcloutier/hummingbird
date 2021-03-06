class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)
    sign_in @user

    if @user.created_at < 2.minutes.ago
      redirect_to "/"
    else
      redirect_to "/onboarding/start"
    end
  end
end
