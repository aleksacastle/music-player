class Admins::UsersController < Admins::BaseController
  helper Admins::UsersHelper

  before_action :find_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(params_user)
      redirect_to admins_user_path(@user.id), notice: "User has sucessfuly updated"
    else
      render :edit, error: "Something wrong"
    end
  end

  def destroy
    @user.destroy
    redirect_to admins_users_path
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def params_user
      params.require(:user).permit!
    end
end
