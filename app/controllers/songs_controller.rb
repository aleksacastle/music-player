class SongsController < BaseController
  before_action :find_album

  def index
    @songs = current_user.songs.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(artist_song_params)
    authorize @song
    if @song.save
      redirect_to album_path(@album),
      notice: "Song was successfully created."
    else
      redirect_to new_album_song_path
    end
  end

  def destroy
    @song.destroy?
    redirect_to song_url, notice: "Song was successfully destroyed."
  end

  private

    def find_album
      @album = Album.find(params[:album_id])
    end

    def artist_song_params
      params.require(:song).permit(:title, :artist, :file)
    end

  # def user_song_params
  #   params.require(:song).permit(:title, :artist, :file, :playlist_ids [], genre_ids: [])
  # end
end
