class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(message: params[:message], user_id: User.find_by(uid: session[:login_uid]).id)
    if @tweet.save
      flash[:notice] = 'つぶやきが投稿されました'
      redirect_to top_main_path
    else
      render :new
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:notice] = 'つぶやきが削除されました'
    redirect_to tweets_path
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(message: params[:tweet][:message])
      flash[:notice] = '内容が編集されました'
      redirect_to tweets_path
    else
      render :edit
    end
  end
  
  
  
end
