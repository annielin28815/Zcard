module SessionsHelper
  def current_user
    if session[:user999].present?
      # 11/20(16:50)
      @user || = User.find_by(email: session[:user999])
    else
      nil
    end
  end
end