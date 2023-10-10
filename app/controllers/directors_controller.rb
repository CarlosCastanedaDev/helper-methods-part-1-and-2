class DirectorsController < ApplicationController
def new
  @director = Director.new
end

def index
  @directors = Director.order(dob: :asc)
end

def show
  @director = Director.find(params.fetch(:id))
end

def create
  director_attributes = params.require(:director).permit(:name, :bio, :dob)
  @director = Director.new(director_attributes)

  
  if @director.valid?
    @director.save
    redirect_to directors_url
    
  else
    render "directors/new"
  end
  
end

def edit
  @director = Director.find(params.fetch(:id))
end

def update
  director = Director.find(params.fetch(:id))

  director_attributes = params.require(:director).permit(:name, :bio, :dob)

  
  if director.update(director_attributes)
    redirect_to directors_url, notice: "Director updated successfully"
    
  else
    redirect_to directors_url, alert: "Director failed to update successfully"
  end
  
end

def destroy
  director = Director.find(params.fetch(:id))

  director.destroy

  redirect_to directors_url, notice: "Director successfully deleted"
end


end
