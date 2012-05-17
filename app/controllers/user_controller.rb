class UserController < ApplicationController
  
  # callback from Taskrabbit oauth
  def login
    require 'open-uri'
    require 'json'
    url = ENV['tr_url'] || APP_CONFIG['taskrabbit'][:url]
    
    result = JSON.parse(open( url + "/api/v1/account?access_token=" + params[:access_token]).read)
    remote_info = {}
    result.each do |r|
      remote_info[r[0]] = r[1]
    end
	  
	  user = User.find_or_initialize_by_remote_id(remote_info['id'])      
    user.update_attributes(
      :remote_id      => remote_info['id'], 
      :display_name   => remote_info['display_name'],
      :token          => params[:access_token]
    )
    
    cookies[:user_id] = user.id
    
    redirect_to :controller => "requests"
  end
  
  def logout
    cookies.delete :user_id
    redirect_to :root
  end
  
end
