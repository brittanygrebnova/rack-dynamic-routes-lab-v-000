require 'pry'

class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if @@items.include?(item_name)
          @@items.each do |i|
            resp.write "#{item_name.price}" 
          end
          binding.pry
      else
        resp.write "Item not found"
        resp.status = 400 
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
  
end