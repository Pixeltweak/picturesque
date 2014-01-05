class PhotosController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index, :search]
  impressionist actions: [:show, :index], unique: [:session_hash]

  def index
    @tile_thumbnails = true
    if params[:tag]
      @photos = Photo.limit(24).tagged_with(params[:tag]).order(created_at: :desc).all
    else
      @photos = Photo.limit(24).order(created_at: :desc).all
    end
  end

  def show
    @photo = Photo.find(params[:id])
    impressionist(@photo.user, 'gallery view', unique: [:session_hash])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id

    if @photo.save
      @photo.create_activity :create, owner: current_user
      redirect_to photo_path(@photo.id), notice: 'Photo has been created!'
    else
      render 'new', alert: 'Photo had some issues uploading'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def search
    @tile_thumbnails = true
    @photos = Photo.joins(:user)
                   .where('LOWER(photos.title) LIKE :q OR LOWER(users.name) LIKE :q',
                      { q: "%#{params[:query]}%".downcase
                    })
                   .order(created_at: :desc)
                   .limit(40)
                   .to_a

    @tagged_photos = Photo.tagged_with(params[:query].downcase)
                          .limit(40)
                          .to_a

    @photos = (@photos | @tagged_photos) # union

    render 'index'
  end

  def rate
    @photo = Photo.find(params[:id])
    if current_user.voted_for? @photo
      @photo.unliked_by current_user
    else
      @photo.liked_by current_user
    end

    redirect_to @photo, notice: "You have liked the photo '#{@photo.title}'"
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title, :description, :tag_list)
  end
end
