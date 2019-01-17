class UsersController < Clearance::UsersController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @shouts = @user.shouts
  end

  def create
    @user = user_from_params

    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end

  private

  def users_params
    params.require(:user).permit(:username, :email, :password)
  end

  def user_from_params
    email = user_params.delete(:email)
    username = user_params.delete(:username)
    password = user_params.delete(:password)
    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.username = username
      user.password = password
    end
  end
end
