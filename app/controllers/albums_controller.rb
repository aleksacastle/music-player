class AlbumsController < BaseController
  before_action :find_user, only: %i[:index ]
  before_action :set_album, only: %i[show edit update destroy]

  def index
    @albums = current_user.albums
  end

  def new
    @album = Album.new
  end

  def show
    @album_songs = @album.songs
    #костильчегг
    @album_artist = @album_songs.map(&:artist).first
  end

  def create
    #form object
    @album = Album.new(album_params)
    authorize @album
    # replace code bellow with service object
    # don't forget about policy
    if @album.save
      redirect_to album_path(Album.last.id),
      notice: "Album was successfully created."
    else
      render :new
      flash[:error] = @album.errors.full_messages
    end
  end

  def update
    #form object
    #service object
    if @album.update(album_params)
      redirect_to @album, notice: "Album was successfully updated."
    else
      render :edit
      flash[:error] = @album.errors.full_messages
    end
  end

  def destroy
    #service object
    @album.destroy
    redirect_to albums_url, notice: "Album was successfully destroyed."
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end

    def album_params
      params.require(:album).permit(:title, picture_attributes: [:id, :imageable_id, :imageable_type, :file, :name]).merge(user_id: current_user.id)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
