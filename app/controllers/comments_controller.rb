class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy ]
  def create
   @image = Image.find(params[:image_id])  # Find the image with the associated image_id
   @comment = @image.comments.create(comment_params) # create the comment on the image passing in params
   @comment.user_id = current_user.id if current_user # assigns logged in user's ID to comment
   @comment.save!
   redirect_to image_path(@image)
  end

  def destroy
    @image = Image.find(params[:image_id])
    @comment = @image.comment.find(params[:id])
    @comment.destroy
    redirect_to image_path(@image)
  end

  private

  def comment_params
     params.require(:comment).permit(:name, :response)
  end
end
