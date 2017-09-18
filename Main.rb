require_relative 'Monitor'
require_relative 'Retriever'


#Call to Retriever's constructor for extract the data form the URL
ret = Retriever.new
#Cal to create an array where will be stored the monitor's data
monArray = Array.new()

#Call for get the number of monitors
ret.getMonitors(monArray)
#Call for get the check rate, history multiple notifications 
#and push notifications attributes.
ret.getData(monArray)
#Call for get the price of the monitors
ret.getPrice(monArray)

#Call for print the output in JSON format
puts monArray.to_json
