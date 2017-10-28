class RoutesController < ApplicationController

  def index
    render json: {}
  end

  def show
    render json: ::HashData::Route.new(route_id: params[:id]).perform
  end

  def filter
    filter_params = request.parameters.slice(
      'prosthesis', 'crutches', 'wheelchairTetraplegia', 'wheelchairParaplegia'
    ).select { |_, v| v }
    render json: ::Route.where(filter_params).map(&:attributes)
  end

  def create

  end

  def update
    Route.find(request.parameters['id']).update_attributes(
      prosthesis: request.parameters['prosthesis'],
      crutches: request.parameters['crutches'],
      wheelchair_tetraplegia: request.parameters['wheelchairTetraplegia'],
      wheelchair_paraplegia: request.parameters['wheelchairParaplegia']
    )
  end
end
