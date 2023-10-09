class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @list_of_movies
      end

      format.html do
        render({ :template => "movies/index" })
      end
    end
  end

  def show
    #@the_movie = Movie.where(id: params.fetch(:id)).first

    # The code above replaces the code below

    #the_id = params.fetch(:id)

    #matching_movies = Movie.where(id: the_id)

    #@the_movie = matching_movies.first

    # This is a more concise way of writing the code (find_by), automatically returns the first record

    #@the_movie = Movie.find_by(id: params.fetch(:id))

    # Using find searches id column automatically

    @movie = Movie.find(params.fetch(:id))

  end

  def create
    @movie = Movie.new
    @movie.title = params.fetch(:title)
    @movie.description = params.fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_url, notice: "Movie created successfully."
    else
      render "movies/new"
    end
  end

  def edit
    the_id = params.fetch(:id)

    matching_movies = Movie.where(id: the_id)

    @movie = matching_movies.first

  end

  def update
    the_id = params.fetch(:id)
    movie = Movie.where(id: the_id).first

    movie.title = params.fetch("query_title")
    movie.description = params.fetch("query_description")

    if movie.valid?
      movie.save
      redirect_to movie_url, notice: "Movie updated successfully."
    else
      redirect_to movie_url, alert: "Movie failed to update successfully."
    end
  end

  def destroy
    the_id = params.fetch(:id)
    movie = Movie.where(id: the_id).first

    movie.destroy

    redirect_to root_url, notice: "Movie deleted successfully."
  end
end
