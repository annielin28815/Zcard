class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    # pw = Digest::SHA1.hexdigest("a#{params[:user][:password]}z")
    # @user = User.find_by(email: params[:user][:email],password: pw)

    user = User.login(params[:user])

    # 11/20(15:45)
    if user
      # 發號碼牌，每個人都會有一張9527的號碼牌，但個別會有自己的email帳號，所以仍然是獨一無二的號碼牌。有號碼牌不代表登入成功。因為伺服器可能還沒承認。
      # session[:user999] = params[:user][:email]
      session[:user999] = user.id
      redirect_to root_path, notice: '登入成功'
    else
      # 因為不想給登入失敗的人去猜測
      redirect_to session_path, notice: '登入失敗'
    end
  end

  def destroy
    session[:user999] = nil
    redirect_to root_path, notice: '已登出'
  end

end