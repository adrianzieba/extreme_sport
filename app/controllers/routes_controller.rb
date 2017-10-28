class RoutesController < ApplicationController

  def index
    render json: Route.all.map(&:attributes)
  end

  def show
    render json: ::HashData::Route.new(route_id: params[:id]).perform
  end

  def create

  end

  def update
    Route.find(params['id']).update_attributes(
      prosthesis: params['prosthesis'],
      crutches: params['crutches'],
      wheelchair_tetraplegia: params['wheelchairTetraplegia'],
      wheelchair_paraplegia: params['wheelchairParaplegia']
    )
  end
end
