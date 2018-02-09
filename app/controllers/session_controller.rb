class SessionController < ApplicationController
  def login
    p request.headers["authentication"]
    # render json:{'users'=>request.headers["authentication"]}
    token = User.authenticate(params[:username],params[:password])
    p params[:username]
    p params[:password]
    p token
    if (token)
      render json:{'token'=>token}
    else
      render json:{"error"=>"wrong password"},status: 401
    end
  end

  def logout
    render json:{'users'=>User.all}
  end
end
