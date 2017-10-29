class RoutesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Route.all.sort_by { |route| route.created_at }.map(&:attributes)
  end

  def show
    render json: ::HashData::Route.new(route_id: params[:id]).perform
  end

  def filter
    filter_params = request.parameters.slice(
      'prosthesis', 'crutches', 'wheelchair_tetraplegia', 'wheelchair_paraplegia'
    ).select { |_, v| v }
    render json: ::Route.where(filter_params).map(&:attributes)
  end

  def create
  end

  def update
    RouteUpdater.new(params: request.parameters).perform
    render json: { status: 'ok' }
  end

  def export
    send_data File.open(Rails.root.join(filename)).read, filename: filename
  end

  def extreme_points
    ::MarkExtremePoints.new(JSON.parse(request.body.read)["points"]).perform
  end

  private

  def filename
    Route.find(request.parameters['id']).filename
  end
end
