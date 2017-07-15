class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if current_user.role = "artist"
      if @album.save
        redirect_to @album, notice: "Album was successfully created."
      else
        render :new
      end
    else
      redirect_to @album, notice: "Just artist can create albums."
    end
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: "Album was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_url, notice: "Album was successfully destroyed."
  end

  private
    def album_params
      params.require(:album).permit(:title, :file_cover, :user_id)
    end
end
