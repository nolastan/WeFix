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

    post_url = url + "tasks"

    
    require 'typhoeus'
    require 'json'
    request = Typhoeus::Request.post(post_url, :params => {:task => {:name => "My Task", :named_price => 23}}, :headers => {:Authorization => "OAuth " + User.find(cookies[:user_id]).token})
  end
  
end
