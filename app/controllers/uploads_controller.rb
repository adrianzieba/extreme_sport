class UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    render json: route, status: 201
  end

  private

  def route
    @route ||= RouteCreator.new(file.path).perform
  end

  def file
    @file ||= FileCreator.new(params: params.permit(:file)).perform
  end
end
