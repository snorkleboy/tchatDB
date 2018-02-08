class UsersController < ApplicationController
  def create
    newUser = User.create(:username=>params[:username])
    render json:{"hello"=>"world", "params"=>params, 'user'=>newUser}
  end

  def index
    render json:{"hello"=>"world", "users"=>User.all}
  end

  def show
    render json:{"hello"=>"world", "params"=>User.find(params['id'])}
  end

  def destroy
  end
end
