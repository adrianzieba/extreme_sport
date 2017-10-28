class UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    RouteCreator.new(file.path).perform
    render nothing: true
  end

  private

  def file
    @file ||= FileCreator.new(params: params.permit(:file)).perform
  end
end
