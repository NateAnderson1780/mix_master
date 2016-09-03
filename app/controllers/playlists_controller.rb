class PlaylistsController < ApplicationController
  before_action :set_playlist, only: [:show, :edit, :update]
  
  def index
    @playlists = Playlist.all 
  end
  
  def new 
    @playlist = Playlist.new
    @songs = Song.all 
  end
  
  def show 
  
  end
  
  def edit  
  
  end
  
  def update 
    if @playlist.update(playlist_params)
      redirect_to @playlist 
    else 
      render :edit
    end
  end
  
  def create 
    @playlist = Playlist.create(playlist_params)
    redirect_to @playlist
  end
  
  private
  
  def set_playlist 
    @playlist = Playlist.find(params[:id])
  end
  
  def playlist_params 
    params.require(:playlist).permit(:name, song_ids: [])
  end
end