require "servethis/version"
require "webrick"
require "optparse"
require "servethis/noncachingfilehandler"

options = {
  :Port => 8000,
  :DocumentRoot => ".",
  :ServerSoftware => "WEBrick/#{WEBrick::VERSION} " +
                         "(Ruby/#{RUBY_VERSION}/#{RUBY_RELEASE_DATE}) " +
                         "servethis/#{Servethis::VERSION}",
}

OptionParser.new do |opts|
  opts.banner = "Usage: #{$0} [doc_root] [-p port]"

  opts.on("-p", "--port PORT", "Use specified port") do |p|
    options[:Port] = p
  end
end.parse!

options[:DocumentRoot] = ARGV[0] if ARGV[0]

document_root = options[:DocumentRoot]
options.delete(:DocumentRoot)

server = WEBrick::HTTPServer.new( options )
server.mount("/", NonCachingFileHandler, document_root, server.config[:DocumentRootOptions])
trap("INT") { server.shutdown }
server.start
