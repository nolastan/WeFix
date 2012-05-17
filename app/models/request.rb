class Request < ActiveRecord::Base
  
  def tr_url
    tr = Taskrabbit::Api.new
    t = tr.tasks.find(tr_id)
    l = t.links['html']
    
    # TODO api returning wrong url
    url = ENV['tr_url'] || APP_CONFIG['taskrabbit'][:url]
    l.gsub("http://s-app1.taskrabbit.com", url) 
  end
  
  def is_backed?
    tr_id.nil?
  end
  
  def tr_user
    tr = Taskrabbit::Api.new
    t = tr.tasks.find(tr_id)
    t.user['display_name']   
  end
  
  def tr_post_datetime
    tr = Taskrabbit::Api.new
    t = tr.tasks.find(tr_id)
    t.state_changed_at 
  end
  
end
