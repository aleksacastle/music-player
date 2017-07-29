class PlaylistSongsController < BaseController
  before_action :set_playlist, only: %i[create new]

  def new
    songs =  if params[:search]
       Song.where(["title LIKE ?", "%#{params[:search]}%"])
     else
       Song.all
     end
     respond_to do |format|
       format.html
       format.js do
         render partial: "new",
         locals: {songs: songs, playlist_song_ids: playlist_songs}
       end
      end
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

    def playlist_songs
      @playlist.song_ids
    end
end
