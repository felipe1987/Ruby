require 'json'

#Class definition
class Monitor	

	# Constructor method
	def initialize 
		
		@monitors
        	@check_rate
        	@history
        	@multiple_notifications
        	@push_notifications
        	@price
	end




	#Method to format the output to JSON
	def as_json(options={}){
      		monitors: @monitors,
        	check_rate: @check_rate,
        	history: @history,
        	multiple_notifications: @multiple_notifications,
        	push_notifications: @push_notifications,
        	price: @price 
        }
    	end

    	def to_json(*options)
        	as_json(*options).to_json(*options)
    	end
	attr_accessor :monitors, :check_rate, :history, :multiple_notifications, :push_notifications, :price


end
