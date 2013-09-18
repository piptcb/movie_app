class MoviesController < ApplicationController

before_action :get_movie, :only => [:show, :edit, :update, :destroy]

  def index
  	 @movies = Movie.released 
  end

  def show 
  end 

  def edit 
   end 


  def get_movie 
  	@movie = Movie.find(params[:id])
  end 

  def update  
  	
   	if @movie.update(movie_params)
      flash[:notice] = "Movie Successfully Updated!"
  	   redirect_to @movie
    else 
      render :edit 
    end 
  end  

  def new 
  	@movie = Movie.new 
  end 


  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new
    end
  end

  
  def destroy 
    @movie = Movie.destroy(@movie)
    redirect_to movies_path, alert: "Movie successfully deleted!"
  end 


  private 
  
  def movie_params 
    movie_params = params.require(:movie).permit(:title, :rating, :total_gross, :released_on, :description, :cast, :duration, :director, :image_file_name)
    
  end 


  

end
