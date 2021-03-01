class SightingsController < ApplicationController

  def index 
    sightings = Sighting.all
    render json: sightings, include: [bird: {except: %i[created_at updated_at]}, location: { except: %i[created_at updated_at] }], except: %i[created_at updated_at]
  end
  
  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: sighting, include: %i[bird location]
    else
      render json: { message: 'No sighting found with that id'}
    end
  end
end
