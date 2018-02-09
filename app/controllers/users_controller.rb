class UsersController < ApplicationController
  def create
    newUser = User.new(:username=>params[:username])
    if (newUser.save)
      render json:{'users'=>[newUser]}
    else
      render json:{'error'=>newUser.errors.full_messages}
    end
  end

  def index
    render json:{'users'=>User.all}
  end

  def show
    user = User.find(params['id'])
    if (user)
      render json:{"#{id}"=>user}
    else
      render json:{"error"=>"couldnt find that user"}
    end
  end

  def destroy
    user = User.find(params['id'])
    if (user && user.destroy)
      render json:{"#{id}"=>user}
    else
      render json:{'error'=>newUser.errors.full_messages}
    end
  end
end
