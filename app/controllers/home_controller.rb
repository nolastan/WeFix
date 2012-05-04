class HomeController < ApplicationController
  def index
    @requests = Request.where(:status => "open").where("media_url IS NOT NULL").order("requested_datetime DESC").limit(3)
    
    tr = Taskrabbit::Api.new
    @tasks = tr.tasks.all
    print @tasks
  end
  
end
