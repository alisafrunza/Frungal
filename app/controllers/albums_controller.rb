class AlbumsController < ApplicationController
  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(album_params)
    if @album.save
      redirect_to albums_path
    else
      flash[:error] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

   def update
    @album = Album.find(params[:id])
    @album.update_attributes(album_params)
    redirect_to albums_path
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :description, :image)
  end
end