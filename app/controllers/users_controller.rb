class UsersController < BaseController
  before_action :find_user, except: :index

  def index
    @users = User.all
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Info updated"
      redirect_to user_path(current_user)
    else
      render "edit"
    end
  end

  def destroy
    @user.destroy
  end

  private

    def user_params
      params.require(:user).permit(:avatar, :avatar_cache, :first_name, :last_name, :nick_name,
        :email, :password, :password_confirmation, :remove_avatar)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
