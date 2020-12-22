class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(uid: params[:uid], pass: BCrypt::Password.create(params[:pass]), age: params[:age])
    if @user.save
      flash[:notice] = 'ユーザが登録されました'
      render template: 'top/login'
    else
      render :new
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = 'ユーザが削除されました'
    redirect_to users_path
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(uid: params[:user][:uid])
      flash[:notice] = '内容が編集されました'
      redirect_to root_path
    else
      render :edit
    end
  end
  
  
end
