class ApplicationController < ActionController::Base

    # 只要在這class裡的action出錯，可以依循後面的方法，引導去別的頁面轉址或印出notice訊息等。
  # rescue_from 是一個類別方法。

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  def record_not_found
    render file: 'public/404.html',layout: false, status: :not_found
  end 

end
