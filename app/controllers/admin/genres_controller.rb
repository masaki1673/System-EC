class Admin::GenresController < ApplicationController
 def edit
  @genre = Genre.find(params[:id])
  if @genre == current_admin
      render :edit
  end 
 end
 def index
  @admin = current_admin
  @genres = Genre.all
  @genre = Genre.new
 end
 def create
    @genres = Genre.new(genre_params)
    if @genres.save
      flash[:notice]= 'successfully create genre!'
      redirect_to admin_genres_path
    end
 end
 def update
   @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = 'successfully update!'
      redirect_to admin_genres_path
    end
 end
 private
  def genre_params
  params.require(:genre).permit(:name)
  end
end
