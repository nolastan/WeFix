class RequestsController < ApplicationController
  def index
    @requests = Request.where(:status => "open").where("media_url IS NOT NULL").order("requested_datetime DESC")
  end

  def show
    @request = Request.find(params[:id])
    
  end
  
  def remote_post
    require "uri"
    require "net/http"

    url = URI.parse(APP_CONFIG['taskrabbit'][:dev_url] + "tasks.php?access_token=" + User.find(cookies[:user_id]).token)
    params = {
      "task" => {
        "name" => "Dog walking",
        "named_price" => 20, 
        "city_id" => 1,
        "description" => "I want you to walk him to his favorite state park",
        "cost_in_cents" => 500,
        "virtual" => true
      }
    }
    
    # @request = Request.find(params[:id])
    print "POSTING TO " + APP_CONFIG['taskrabbit'][:url] + "tasks?access_token=" + User.find(cookies[:user_id]).token
    x = Net::HTTP.post_form(url, params)
    print x
    print x.body
    print "END POST"
  end
  
end
