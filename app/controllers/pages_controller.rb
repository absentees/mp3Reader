class PagesController < ApplicationController
  helper_method :sort_column, :sort_direction
  def home
    @title = "Home"
    if user_signed_in?
      @feed_items = current_user.feed_items.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 15, :page => params[:page])

    end
#<User id: nil, email: "", encrypted_password: "", password_salt: "", reset_password_token: nil, remember_token: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, created_at: nil, updated_at: nil>

  end

  private

  def sort_column
    if Website.column_names.include?(params[:sort]) || Link.column_names.include?(params[:sort])
       params[:sort]
    else
      "name"
    end
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
