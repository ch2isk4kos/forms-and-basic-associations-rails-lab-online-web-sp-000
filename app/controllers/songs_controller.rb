class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def show
    end

    def new
        @song = Song.new
    end

    def create
        # @song = Song.new(song_params)
        @song = Song.new(song_params)

        if @song.save
            redirect_to @song
        else
            render :new
        end

    end

    def edit
    end

    def update
        @song.update(song_params)

        if @song.save
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        @song.destroy
        flash[:notice] = "Song deleted."
        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
    end

    def find_song
        @song = Song.find(params[:id])
    end

    # def song_artist
    #     @song = Song.find_by_id(:artist_id)
    # end
    #
    # def song_genre
    #     @song = Song.find_by_id(:genre_id)
    # end
end
