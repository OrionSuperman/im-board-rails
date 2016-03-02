class AddAddressToEventModel < ActiveRecord::Migration
  def change
  	add_column("events", "street1", "string")
  	add_column("events", "street2", "string")
  	add_column("events", "city", "string")
  	add_column("events", "state", "string")
  	add_column("events", "zipcode", "string")
  	add_column("events", "latitude", "float")
  	add_column("events", "longitude", "float")
  end
end
