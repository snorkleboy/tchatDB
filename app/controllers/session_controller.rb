class SessionController < ApplicationController
  def login
    p request.headers["authentication"]
    render json:{'users'=>request.headers["authentication"]}
  end

  def logout
    render json:{'users'=>User.all}
  end
end
