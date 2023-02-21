class SessionsController < AppliucationController 
    def new 
        render :new
    end

    def create 
        @user = User.find_by_credentials(params[:user][:usrename], params[:user][:password])

        if @user
            login(@user)
            redirect_to @users_url
        else
            render :new
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end
