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
      flash[:error] = @playlist.errors.full_messages.to_sentence.to_s
    end
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist, notice: "Playlist was successfully updated."
    else
      render :edit
      flash[:error] = @playlist.errors.full_messages.to_sentence.to_s
    end
  end

  def destroy
    # service object
    @playlist.destroy
    redirect_to playlists_url, notice: "Playlist was successfully destroyed."
  end

  private
    def find_playlist
      @playlist = Playlist.find(params[:id])
    end

    def playlist_params
      params.require(:playlist).permit(:title, :user_id, picture_attributes: [:id, :imageable_id, :imageable_type, :file, :name])
    end
end
