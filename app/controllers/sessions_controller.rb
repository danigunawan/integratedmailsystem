class SessionsController < ApplicationController
  layout "empty"
  skip_before_filter :verify_authenticity_token, :only => [:create]
  skip_before_filter :logged_in_user
  skip_authorization_check :only => [:new,:create, :destroy]

  # load_and_authorize_resource 
  def new
   if logged_in?
       redirect_to landing_url

    end
  end

  def create

    username = params['session']['username'].to_s
    password = params['session']['password'].to_s


    user = User.find_by username: username

    respond_to do |format|

     if user && user.authenticate(params[:session][:password])
        user ||= User.new
        log_in user

        # Audit purpose
        create_user_activity "Login from " + request.remote_ip.to_s

        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        # remember user
        if user.role == 'staf'
          format.html { redirect_to mydis_url }
        else
          format.html { redirect_to landing_url }
        end
        # end

      else
        format.html { redirect_to controller: 'sessions', action: 'create', notice: 'Username atau Password salah. <br>Lupa Password? Hubungi IT PGN Solution.' }
      end
    end
  end

  def destroy
    # Audit purpose
    create_user_activity "Logout from " + request.remote_ip.to_s

    log_out #if logged_in?
    redirect_to root_url
  end

end
