module SessionsHelper
  def current_user
    if session[:user999].present?
      # 11/20(16:50)
      # 下行的原型 -> @user = @user || User.find_by(email: session[:user999])
      @_user666 ||= User.find_by(id: session[:user999])
    else
      nil
    end
  end

  # 目前的使用者是否有登入：會回傳true或false
  def user_signed_in?
    if current_user
      return true
    else
      return false
    end
  end


end