class UsersController < ApplicationController
  def my_images
    @user = current_user
  end

  def my_friends
    @friends = current_user.friends
  end
end
