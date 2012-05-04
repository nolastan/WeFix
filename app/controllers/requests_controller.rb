class RequestsController < ApplicationController
  def index
    @requests = Request.where(:status => "open").where("media_url IS NOT NULL").order("requested_datetime DESC")
    tr = Taskrabbit::Api.new
    @tasks = tr.tasks.all
  end

  def show    
    @request = Request.find(params[:id])
  end
  
  # {
  #    "task": {
  #      "name":"My First Task", 
  #      "named_price": 20, 
  #      "other_locations_attributes": [
  #        {
  #          "name": "Home",
  #          "address": "123 Main St",
  #          "city": "Boston",
  #          "state": "MA",
  #          "zip": "02154",
  #          "lat": "42.358432",
  #          "lng": "-71.059774"
  #        }, 
  #        {
  #          "name": "Middle of the park",
  #          "lat": "42.358430",
  #          "lng": "-71.059772"
  #        }
  #      ]
  #    }
  #  }
  #  
  def remote_post
    request = Request.find(params[:id])
    user = User.find(cookies[:user_id])
    
    tr = Taskrabbit::Api.new(user.token)
    
    # location = tr.locations.create({
    #   :name => "Incident location",
    #   :address => request.address,
    #   # "zip" => request.zipcode,
    #   :lat => request.lat,
    #   :lng => request.long
    # })

    task = tr.tasks.create({
      :named_price => 30, 
      :name => request.service_name,
      :description => request.description,
      # :city_id => user.city_id, 
      :virtual => false,
      # :other_locations_attributes => location
    })
    
    if(task.error != nil)
      flash[:error] = task.error
    end
    
    request.tr_id = task.id
    request.save
    
    redirect_to url_for(request)
  end
  
end
