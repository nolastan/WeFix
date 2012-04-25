class RequestsController < ApplicationController
  def index
    @requests = Request.where(:status => "open").where("media_url IS NOT NULL").order("requested_datetime DESC")
  end

  def show
    require "uri"
    require "net/http"
    
    @request = Request.find(params[:id])
    url = ENV["tr_url"] || APP_CONFIG['taskrabbit'][:url]
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
    # @post_url = URI.parse(url + "tasks.php?access_token=" + User.find(cookies[:user_id]).token)
    @post_url = "http://stanfordrosenthal.com/wefix/referer.php"
    print "\n"
    print "\n"
    print "\n"
    print @post_url
    print "\n"
    print Net::HTTP::Post.new(@post_url.path)
    print "\n"
    print Net::HTTP::Post.new(@post_url.path).body
    print "\n"
    print "\n"
    print "\n"
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
