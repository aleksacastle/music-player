class AlbumsController < BaseController
  before_action :find_user, except: %i[:new :create]
  before_action :set_album, only: %i[:show :edit :update :destroy]

  def index
    @albums = current_user.albums
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to @album, notice: "Album was successfully created."
    else
      render :new
    end
  end

  def update
    if @album.update(album_params)
      redirect_to @album, notice: "Album was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_url, notice: "Album was successfully destroyed."
  end

  private
    def set_album
      @album = Album.find(params[:id])
    end
    def album_params
      params.require(:album).permit(:title, :file_cover).merge(current_user: :user_id)
    end

    def find_user
      @user = User.find(params[:id])
    end
end
