class RegistrationsController < Devise::RegistrationsController
  ARTIST_ROLE = 1
  USER_ROLE = 0

  private
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
        .merge(role)
    end

    def role
      return { role: ARTIST_ROLE } if params.fetch(:user, {})
        .fetch(:artist, USER_ROLE) == ARTIST_ROLE.to_s
      { role: USER_ROLE }
    end
end
