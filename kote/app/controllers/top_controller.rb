class TopController < ApplicationController
    
    def main
        if session[:login_uid] != nil
            @tweets = Tweet.all
            render :main
            # render template: 'tweets/index'
        else
            render :login
        end
    end
    
    def login
        if User.authenticate(params[:uid], params[:pass])
          session[:login_uid] = params[:uid]
          redirect_to root_path
        else
          render :error
        end
    end
    
    def logout
        session.delete(:login_uid)
        @tweets = Tweet.all
        render :main
        logger.debug("ログアウトされました")
    end
    
end
