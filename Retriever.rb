require 'nokogiri'
require 'open-uri'
require_relative 'Monitor'

#Constant wich store the URL
HTML = "https://www.port-monitor.com/plans-and-pricing"

#Constant wich store the XPATH for extract the number of monitors
X_PATH_MON = "//div/div/div/div/div/div/div/div/div/div/h2" 

#Constant wich store the XPATH for extract the check rate, history multiple notifications 
#and push notifications attributes.
X_PATH_DATA = "//div/div/div/div/div/div/div/div/div/div/dl/dd"

#Constant wich store the XPATH for extract the price of the monitors
X_PATH_PRICE = "//div/div/div/div/div/div/div/div/div/div/p"

#Class wich retrieves data from the HTML source page
class Retriever

	#Cosntructor 
	def initialize
		#Local variables used to access to the array where the data's monitors
		#will be stored
		myIndex = 0
		index = 0
		#Instance variables
		@html = Nokogiri::HTML(open(HTML).read)
		@product
		
	end

	#Method wich extract and store the number of monitors
	def getMonitors(monArray)
		@product = @html.xpath(X_PATH_MON)
		@product.each do |tagcloud_element|
			monitor = Monitor.new
			monitor.monitors = tagcloud_element.text
			monArray.push(monitor)
			
  			
			
		end
	
	end

	#Method wich extract and store the check rate, history multiple notifications 
	#and push notifications attributes.
	def getData(monArray)
		myIndex = 0
		index = 0

		@product = @html.xpath(X_PATH_DATA)
		while(index<@product.length)
			myIndex = index/4
			
			(monArray.at(myIndex)).check_rate = ((@product.at(index)).text).gsub(/[^\d]/, '')	
			index +=1
			
			(monArray.at(myIndex)).history = ((@product.at(index)).text).gsub(/[^\d]/, '')	
			index +=1

			(monArray.at(myIndex)).multiple_notifications = (@product.at(index)).text
			index +=1

			(monArray.at(myIndex)).push_notifications = (@product.at(index)).text
			index +=1
		
		end
	
	end
	
	#Method wich extract and store the price of monitors
	def getPrice(monArray)
		index = 0
		@product = @html.xpath(X_PATH_MON)
		while(index<@product.length)
			(monArray.at(index)).price =  (@product.at(index)).text
			index +=1
		end

	end

end
