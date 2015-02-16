class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_or_create_for_github_oauth(oauth_data)
    User.find_or_initialize_by( uid: oauth_data.uid,provider: oauth_data.provider)
  end

  def update_credentials(oauth_data)
    self.token = oauth_data.credentials.token
  end
end
