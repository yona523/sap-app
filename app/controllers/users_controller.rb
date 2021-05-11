class UsersController < ApplicationController
  
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]
  
  def index
    #User.order(id: :desc)で降順で一覧表示、page(params[:page]).per(20)で１ページにつき25件取得
    @users = User.order(id: :desc).page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(id: :desc).page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def microposts
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page])
  end
  
  def likes
    @user = User.find(params[:id])
    @favorites = @user.fav_microposts.page(params[:page])
    counts(@user)
  end
  
  private

  def user_params
    #パスワードを暗号化するため
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
