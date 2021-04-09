module SessionsHelper
  #current_userは、現在ログインしているユーザを取得するメソッド
  def current_user
    #@current_userにすでにユーザーが代入されていたら何もせず、代入されていなかったら、ログインユーザーを所得し代入する
    @current_user ||= User.find_by(id: session[:user_id])
  end


  def logged_in?
    !!current_user
  end
end
