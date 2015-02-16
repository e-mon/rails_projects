class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    oauth_data = request.env['omniauth.auth']
    @user = User.find_or_create_for_github_oauth(oauth_data)
    @user.update_credentials(oauth_data)
    @user.save

    sign_in_and_redirect @user
  end
end
