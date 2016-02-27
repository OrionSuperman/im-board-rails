class AddTitleToAddressAndEventaddress < ActiveRecord::Migration
  def change
  	add_column("addresses", "title", "string")
  	add_column("eventaddresses", "title", "string")
  end
end
