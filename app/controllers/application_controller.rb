class ApplicationController < ActionController::Base
  protect_from_forgery
  #def after_sign_in_path_for(resource)
  #  statuses_path || root_path
  #end

  def error_404
    url = request.url 
    render :status=>404,
    :text=>"<!DOCTYPE HTML PUBLIC \"-//IETF//DTD HTML 2.0//EN\">
<html><head>
<title>404 Not Found</title>
</head><body>
<h1>Not Found</h1>
<p>The requested URL #{url} was not found on this server.</p>
</body></html>
"
  end
end
