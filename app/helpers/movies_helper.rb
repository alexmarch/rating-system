module MoviesHelper
  def get_client_ip
     @client_ip = request.remote_ip
  end
end
