class Song
  class CreatePolicy
    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end
    def allowed?
      current_user.artist?
    end
  end
end
