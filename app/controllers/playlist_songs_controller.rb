class PlaylistSongsController < BaseController
  before_action :set_playlist, only: %i[create new search]

  def search
    @songs = Song.where(["title LIKE ?", "%#{params[:search]}%"])
  end

  def new
    @songs = Song.all
  end

  def create
    # form object, there you will validate :useless_songs_ids, :new_songs_ids
    # service object: that will complete the same work
    @playlist.update(playlist_params)
    redirect_to playlist_path(@playlist)
  end

  private

    def set_playlist
      @playlist ||= Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(song_ids: [])
    end
end
