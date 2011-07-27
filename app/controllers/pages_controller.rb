class PagesController < ApplicationController

  def home
    @title = "Home"
    if user_signed_in?
          @feed = current_user.feed
    end
#<User id: nil, email: "", encrypted_password: "", password_salt: "", reset_password_token: nil, remember_token: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, created_at: nil, updated_at: nil>

  end
end
