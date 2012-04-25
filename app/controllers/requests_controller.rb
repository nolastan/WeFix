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
    url =  ENV["tr_dev_url"] || APP_CONFIG['taskrabbit'][:dev_url]

    post_url = URI.parse(url + "tasks.php?access_token=" + User.find(cookies[:user_id]).token)
    params = {
      "task" => {
        "name" => "Dog walking3",
        "named_price" => 20, 
        "city_id" => 1,
        "description" => "I want you to walk him to his favorite state park",
        "cost_in_cents" => 500,
        "virtual" => true
      }
    }
    
    # @request = Request.find(params[:id])
    # print "POSTING TO " + post_url + "tasks?access_token=" + User.find(cookies[:user_id]).token
    Net::HTTP.post_form(post_url, params)
    print "END POST"
  end
  
end
