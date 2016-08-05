class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def sign_in(user)
    session[:user_id] = user.id
  end

  def user_signed_in?
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if user_signed_in?
  end
  helper_method :current_user

  def current_user_profile
    @current_user_profile = Profile.find_by_user_id(current_user)
  end
  helper_method :current_user_profile

  def authenticate_user
    redirect_to new_session_path, notice: "Please Sign in." unless user_signed_in?
  end

  def only_admin
    redirect_to root_path, notice: "Access denied" unless current_user.admin?
  end

  def user_approved?
    current_user.approved? || current_user.admin?
  end

  def approved_user
    redirect_to before_approval_users_path unless user_approved?
  end

  def find_profile
    if current_user.admin
      @profile = Profile.find params[:profile_id]
    else
      @profile = current_user_profile
    end
  end
end
