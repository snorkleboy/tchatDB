class UsersController < ApplicationController
  def create
    newUser = User.new(:username=>params[:username],:password=>params[:password])
    if (newUser.save)
      token = newUser.login()
      render json:{'token'=>token}
    else
      render json:{'error'=>[newUser.errors.full_messages]},status: 400
    end
  end

  def index
    render json:{'users'=>User.all.map{|user| [user.id,user.username]}}
  end

  def show
    user = User.find(params['id'])
    if (user)
      render json:{"#{id}"=>user}
    else
      render json:{"error"=>"couldnt find that user"},status: 400
    end
  end

  def destroy
    user = User.find(params['id'])
    if (user && user.destroy)
      render json:{"#{id}"=>user}
    else
      render json:{'error'=>newUser.errors.full_messages},status: 400
    end
  end

  def isuser
    user = User.find_by(username: params[:username])
    if (user)
      render json:{'isuser'=>true}
    else
      render json:{'isuser'=>false}
    end
  end
end
