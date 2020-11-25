class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    pass = BCrypt::Password.create(params[:user][:pass])
    @user = User.new(uid: params[:user][:uid], pass: pass)
    if @user.save
      flash[:info] = 'ユーザー登録に成功しました'
      redirect_to users_path
    else
      @user.pass = ""
      render :new
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:info] = 'ユーザー削除に成功しました'
    redirect_to users_path
  end
end

