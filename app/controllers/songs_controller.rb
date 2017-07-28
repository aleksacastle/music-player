class SongsController < BaseController
  before_action :find_album, except: :search
  before_action :find_song, only: %i[destroy]

  def show
  end

  def index
    # service object
    # policy object
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
    # form object
    # service object
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
    # service object
    authorize @song
    @song.destroy
    # need this in edit album
    redirect_to edit_album_path(@album), notice: "Song was successfully destroyed."
  end

  def search
    @songs = Song.where(["title LIKE ?", "%#{params[:search]}%"])
  end

  private

    def find_album
      @album = Album.find(params[:album_id])
    end

    def find_song
      @song = Song.find(params[:id])
    end

    def artist_song_params
      params.require(:song).permit(:title, :artist, :file)
    end
end
