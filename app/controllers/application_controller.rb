class ApplicationController < ActionController::Base
  include SessionsHelper
  include Pundit

  # 只要在這class裡的action出錯，可以依循後面的方法，引導去別的頁面轉址或印出notice訊息等。
  # rescue_from 是一個類別方法。

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  def record_not_found
    render file: 'public/404.html',layout: false, status: :not_found
  end 

  def session_required
    redirect_to sign_in_users_path, notice: '請先登入會員' unless user_signed_in?
  end
end
