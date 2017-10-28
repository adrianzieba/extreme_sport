class FileCreator
  def initialize(params: params)
    @params = params
  end

  def perform
    file.write(params[:file].read)
    file.close
    file
  end

  private
  attr_reader :params

  def file
    @file ||= File.new(file_path, 'wb')
  end

  def file_path
    File.join('tmp', 'files', file_name)
  end

  def file_name
    Time.now.to_i.to_s
  end
end
