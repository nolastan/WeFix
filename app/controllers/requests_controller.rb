class RequestsController < ApplicationController
  def index
    @requests = Request.where(:status => "open").where("media_url IS NOT NULL").order("requested_datetime DESC")
  end

  def show    
    @request = Request.find(params[:id])
    @related = Request.where(:status => "open").where("media_url IS NOT NULL").where("service_name = '#{@request.service_name}'").order("requested_datetime DESC").limit(6)
  end
  
  def remote_post
    request = Request.find(params[:id])
    user = User.find(cookies[:user_id])
    
    tr = Taskrabbit::Api.new(user.token)
    
    task = tr.tasks.create({
      :named_price => 30, 
      :name => request.service_name,
      :description => request.description,
      :city_id => 1, 
      :virtual => false,
      :other_locations_attributes => [{ 
        :name => request.service_name, 
        :address => request.address,
        :city => "Boston",
        :state => "MA",
        :zip => "02154",
        :lat => "42.358432",
        :lng => "-71.059774"        
      }]
    })
    
    flash[:error] = task.error
    
    request.tr_id = task.id
    request.save
    
    redirect_to url_for(request)
  end
  
end
