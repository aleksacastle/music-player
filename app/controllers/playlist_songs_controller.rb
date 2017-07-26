class PlaylistSongsController < BaseController
  before_action :set_playlist, only: :create

  def new
    @songs = Song.all
  end

  def create
    # form object, there you will validate :useless_songs_ids, :new_songs_ids
    # service object: that will complete the same work
    @playlist.songs.delete(get_songs(useless_songs_ids)) if useless_songs_ids
    @playlist.songs << get_songs(new_songs_ids)          if new_songs_ids

    redirect_to playlist_path(@playlist)
  end

  private

    def set_playlist
      @playlist ||= Playlist.find(params[:id])
    end
    # posible to use query object
    # move it inside service
    def get_songs(ids)
      Song.where(id: ids)
    end
    # move this helper inside service
    def playlist_songs_ids
      @playlist_songs_ids ||= @playlist.songs.pluck(:id)
    end
    # move this helper inside service
    def new_songs_ids
      params[:songs] - playlist_songs_ids if params[:songs]
    end
    # move this helper inside service
    def useless_songs_ids
      return playlist_songs_ids if params[:songs].blank?

      playlist_songs_ids - params[:songs]
    end
end
