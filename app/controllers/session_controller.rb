class SessionController < ApplicationController
  def login
    p request.headers["authentication"]
    token = User.authenticate(params[:username],params[:password])
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

  def tokencheck
    user = User.find_by(username:params[:username])
    if (!user)
      render json:{'error'=>'no such user'},status:400
    end
    if user.myToken?(params[:token])
      render json:{'ok'=>true},status:200
    else
      render json:{'error'=>'wrong token'},status:401
    end
  end
end
