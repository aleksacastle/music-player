class SongsController < BaseController
  before_action :find_album

  def index
    if current_user.artist?
      @songs = current_user.songs.all
    else
      @songs = Song.all
    end
  end

  def new
    @song = Song.new
  end

  def create
    @song = @album.songs.new(artist_song_params)
    authorize @song
    if @song.save
      redirect_to album_path(@album),
      notice: "Song was successfully created."
    else
      redirect_to new_album_song_path
      flash[:error] = @song.errors.full_messages
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
end
