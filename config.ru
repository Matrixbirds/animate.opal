require 'opal'

run Opal::SimpleServer.new { |server|
    server.main = 'app.js.rb'
    server.append_path 'app'
    server.index_path = 'index.html.erb'
}
