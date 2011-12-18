require "servethis/version"
require "webrick"
require "optparse"

options = {
  :Port => 8000,
  :DocumentRoot => "."
}

OptionParser.new do |opts|
  opts.banner = "Usage: #{$0} [doc_root] [-p port]"

  opts.on("-p", "--port PORT", "Use specified port") do |p|
    options[:Port] = p
  end
end.parse!

options[:DocumentRoot] = ARGV[0] if ARGV[0]

server = WEBrick::HTTPServer.new( options )
trap("INT") { server.shutdown }
server.start
