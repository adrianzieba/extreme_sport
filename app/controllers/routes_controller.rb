class RoutesController < ApplicationController

  def index
    render json: {}
  end

  def show
    render json: ::HashData::Route.new(route: params[:route_id]).perform
  end

  def create

  end
end
