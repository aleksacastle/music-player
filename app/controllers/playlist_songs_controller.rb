class PlaylistSongsController < BaseController
  before_action :set_playlist, only: :create

  def new
    @songs = Song.all
  end

  def create
    @playlist.songs.delete(get_songs(useless_songs_ids)) if useless_songs_ids
    @playlist.songs << get_songs(new_songs_ids)          if new_songs_ids

    redirect_to playlist_path(@playlist)
  end

  private

  def set_playlist
    @playlist ||= Playlist.find(params[:id])
  end

  def get_songs(ids)
    Song.where(id: ids)
  end

  def playlist_songs_ids
    @playlist_songs_ids ||= @playlist.songs.pluck(:id)
  end

  def new_songs_ids
    params[:songs] - playlist_songs_ids if params[:songs]
  end

  def useless_songs_ids
    return playlist_songs_ids if params[:songs].blank?

    playlist_songs_ids - params[:songs]
  end
end
