# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "servethis/version"

Gem::Specification.new do |s|
  s.name        = "servethis"
  s.version     = Servethis::VERSION
  s.authors     = ["MOZGIII"]
  s.email       = ["mike-n@narod.ru"]
  s.homepage    = ""
  s.summary     = %q{A small gem that provides an executable to run a WEBrick with specified document root.}
  s.description = %q{A small gem that provides an executable to run a WEBrick with specified document root.}

  s.rubyforge_project = "servethis"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
