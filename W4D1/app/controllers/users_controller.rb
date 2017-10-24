class UsersController < ApplicationController
  def index
    render json: User.all #<- this is referring to the User class MODEL.
  end

  def create
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save #if the user is valid, then it shows the user
        render json: user
    else #this is triggered if the user is invalid (maybe not unique)
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])

    if @user
      render plain: @user.email
    else
      render json: @user.errors.full_messages, message: "You done screwed up"
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      render json: @user
    else
      render json: @user.errors.full_messages, message: "Oopsie daisy"
    end
  end
  #
  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      render json: @user
    else
        render json: @user.errors.full_messages, message: "Immortal, sorry"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

  #in the controller, it basically handles the 8 RESTFUL actions.
  #EVERYTHING ELSE should be left to the model.
  #this is called UsersController because of resource :users.
  #it is the capitalized form of the resource call
  #we made this by rails g controller users
  #that command makes this file! and names it UsersController


end
