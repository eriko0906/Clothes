class UsersController < ApplicationController
  before_action:logged_in_user, only:[:index, :edit, :update]
  before_action:correct_user, only:[:edit, :update]
  before_action:admin_user, only:[:destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @cloths = @user.cloths
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "ユーザ登録完了！"
      redirect_to @user
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザ編集完了！"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザ削除完了"
    redirect_to users_path
  end

  private

    def user_params
      params.require(:user).permit(:image, :name, :email, :password,
                                  :password_confirmation)
    end

    #before_action
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしていないユーザにはその権限がありません"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        flash[:danger] = "あなたはそのページにアクセスする権限がありません"
        redirect_to root_url
      end
    end

    def admin_user
      unless current_user.admin?
        flash[:danger] = "そのページは管理者ユーザのみアクセスする権限が与えられています"
        redirect_to root_url
      end
    end
end
