class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    render("movies/index.html.erb")
  end

  def show
    @movie = Movie.find(params[:id])
    # the_id = params[:id]
    render("movies/show.html.erb")
  end

  def new_form
    render("movies/new_form.html.erb")
  end

  def create_row
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]

    new_movie = Movie.new
    new_movie.title = title
    new_movie.year = year
    new_movie.duration = duration
    new_movie.description = description
    new_movie.image_url = image_url
    new_movie.director_id = director_id

    new_movie.save

    redirect_to("/movies/#{new_movie.id}")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie = Movie.find(params[:id])
    title = params[:title]
    year = params[:year]
    duration = params[:duration]
    description = params[:description]
    image_url = params[:image_url]
    director_id = params[:director_id]

    edit_movie=Movie.find(params[:id])
    edit_movie.title = title
    edit_movie.year = year
    edit_movie.duration = duration
    edit_movie.description = description
    edit_movie.image_url = image_url
    edit_movie.director_id = director_id
    edit_movie.save
    render("show")
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    render("movies/destroy.html.erb")
  end
end
