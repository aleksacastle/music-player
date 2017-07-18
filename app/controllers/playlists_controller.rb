class PlaylistsController < BaseController
  before_action :find_playlist, only: %i[show edit update destroy]

  def index
    @playlists = current_user.playlists.all
  end

  def new
    @playlist = Playlist.new
  end

  def show
    @songs = @playlist.songs.all
  end

  def create
    @playlist = Playlist.new(playlist_params)
    @playlist.user_id = current_user.id
    if @playlist.save
      redirect_to playlists_path, notice: "Playlist was successfully created."
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
    def find_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:title, :file_cover, :user_id)
    end
end
