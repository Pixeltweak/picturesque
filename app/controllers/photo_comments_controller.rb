class PhotoCommentsController < ApplicationController
  before_filter :authenticate_user!

  def edit

  end

  def update

  end

  def destroy

  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment: params[:comment], user: current_user)
    @comment.create_activity :create, owner: current_user, params: {
      title: @photo.title,
      id: @photo.id
    }

    redirect_to @photo
  end
end
