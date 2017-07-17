class SongsController < BaseController
  before_action :find_album, only: %i[index create]
  def new
    @song = Song.new
  end

  def create
    # binding.pry
    @song = Song.new(artist_song_params)
    authorize @song
    if @song.save
      redirect_to album_songs_path(Song.last.id),
      notice: "Song was successfully created."
    else
      redirect_to new_album_song_path
    end
  end

  def destroy
    @song.destroy
    if policy.allowed?
      redirect_to song_url, notice: "Song was successfully destroyed."
    else
      redirect_to song_path notice: "Please contact with the owner"
    end
  end

  private

    def find_album
      @album = Album.find(params[:id])
    end

    def artist_song_params
      params.require(:song).permit(:title, :artist, :file).merger(user_id: :current_user.id)
    end

    def user_song_params
      params.require(:song).permit(:title, :artist, :file, :playlist_ids [], genre_ids: [])
    end
end
