task :sync_requests => :environment do
	Open311.configure do |config|
	  config.endpoint     = 'https://mayors24.cityofboston.gov/open311/v2/'
	  config.api_key      = ''
	  config.jurisdiction = 'cityofboston.gov'
	end
	
	end_date = Time.now.strftime '%Y-%m-%dT%H:%M:%S'
	start_date = (Time.now - 3 * 86400).strftime '%Y-%m-%dT%H:%M:%S'
	requests = Array.new
	
	requests_raw = Open311.service_requests({"start_date" => start_date, "end_date" => end_date, "service_code" => "4e658b2821ecf3e0a900002f"})
	requests_raw[0].each do |request|
    requests << request
	end
	requests_raw = Open311.service_requests({"start_date" => start_date, "end_date" => end_date, "service_code" => "4e658b2821ecf3e0a9000035"})
	requests_raw[0].each do |request|
    requests << request
	end
	requests_raw = Open311.service_requests({"start_date" => start_date, "end_date" => end_date, "service_code" => "4e658b2821ecf3e0a900003e"})
	requests_raw[0].each do |request|
    requests << request
	end
		
	requests.each do |request|

    # Fill in missing service names
    if(request.service_name == "Other" && request.description != nil)
  	  trash_words = ['garbage', 'trash', 'clean', 'litter']
  	  if(trash_words.any? {|word| request.description.downcase.include?(word)})
  	    request.service_name = "Trash"
  	  end

  	  plant_words = ['tree', 'bush', 'trim', 'plant', 'mowed']
  	  if(plant_words.any? {|word| request.description.downcase.include?(word)})
  	    request.service_name = "Landscape"
  	  end

  	  vehicle_words = ['car', 'truck', 'lane', 'parked', 'traffic']
  	  if(vehicle_words.any? {|word| request.description.downcase.include?(word)})
  	    request.service_name = "Vehicle"
  	  end

  	  drainage_words = ['drain', 'clogged', 'flood', 'rain']
  	  if(drainage_words.any? {|word| request.description.downcase.include?(word)})
  	    request.service_name = "Drainage"
  	  end


	  end
	  
	  Request.find_or_initialize_by_remote_id(request.service_request_id).update_attributes({
	    :token => request.token, 
	    :status => request.status, 
	    :service_name => request.service_name, 
	    :service_id => request.service_code, 
	    :description => request.description, 
	    :city_update_datetime => request.updated_datetime, 
	    :requested_datetime => request.requested_datetime, 
	    :address => request.address, 
	    :lat => request.lat, 
	    :long => request.long, 
	    :media_url => request.media_url
	  })
	end
end