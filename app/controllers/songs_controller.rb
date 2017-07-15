class SongsController < ApplicationRecord
  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if policy.allowed?
      if @song.save(params[:song].merge(current_user: current_user))
        redirect_to song_path(Song.last.id),
        notice: "Song was successfully created."
      else
        redirect_to new_song_path
      end
    else
      redirect_to song_path,
      alert: "You must be artist to be able to add songs"
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

    def song_params
      params.require(:song).permit(:title, :artist, :file, :playlist_ids [], genre_ids: [])
    end

    def policy
      Song::CreatePolicy.new(current_user)
    end
end
