class AlbumsController < ApplicationController
	before_action :authenticate_user!

	def index
		@albums = current_user.albums
	end

	def new
	  @album = current_user.albums.new
	end

	def create
	  @album = current_user.albums.new(album_params)
	  @album.save
    if @album.save
  	  redirect_to user_album_path(current_user, @album)
    else
      render 'new'
    end
	end

	def show
    @album = Album.find(params[:id])
  end

	def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to user_albums_path(current_user)
	end

  private
    def album_params
      params.require(:album).permit(:name, photos_attributes: [:id, :image, :tagline,  :_destroy])
    end
end
