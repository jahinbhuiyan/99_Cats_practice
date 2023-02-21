class UsersController < ApplicatiionController
    def new
        render : new
    end

    def create
        @user = User.new(user_param)
        if @user.save
            login(@user)
            redirect_to cats_url
        else
            puts @cats.errors.full_messages
            render :new
        end
    end 

    private
    def user_param
        params.require(:users).permit(:username, :password_digest, :session_token)
    end
end
