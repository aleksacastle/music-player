class PlaylistsController < ApplicationController
  def index
    @playlists = current_user.playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlist.new(playlist_params)
    if @playlist.save
      redirect_to @playlist, notice: "Playlist was successfully created."
    else
      render :new
    end
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist, notice: "Playlist was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_url, notice: "Playlist was successfully destroyed."
  end

  private
    def playlist_params
      params.require(:playlist).permit(:title, :file_cover, :user)
    end
end
