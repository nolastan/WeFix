class RequestsController < ApplicationController
  def index
    @requests = Request.where(:status => "open").where("media_url IS NOT NULL").order("requested_datetime DESC")
  end

  def show    
    @request = Request.find(params[:id])
  end
  
  def remote_post

    url =  ENV["tr_url"] || APP_CONFIG['taskrabbit'][:url]

    print url

    post_url = URI.parse(url + "tasks.php?access_token=" + User.find(cookies[:user_id]).token)

    
    # @request = Request.find(params[:id])
    # print "POSTING TO " + post_url + "tasks?access_token=" + User.find(cookies[:user_id]).token
    print post_url
    print "\n\n --- END POST --- \n\n"
  end
  
end
