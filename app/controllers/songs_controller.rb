class SongsController < ApplicationController
  before_action :find_song, only: [:show, :edit, :update, :destroy]

#CREATE

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

#READ

  def index
    @songs = Song.all
  end

  def show
  end

#UPDATE

  def edit
  end

  def update
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

#DESTROY

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :release_year, :released, :genre)
  end

  def find_song
    @song = Song.find(params[:id])
  end
end
