require File.expand_path("../lib/shoes/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "orange_shoes"
  s.version     = Shoes::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Team Shoes"]
  s.email       = ["shoes@librelist.com"]
  s.homepage    = "http://shoesrb.com/"
  s.summary     = "Traslate Shoes like app written in Ruby, into HTML5 Canvas element written in JavaScript."
  s.description = "Traslate Shoes like app written in Ruby, into HTML5 Canvas element written in JavaScript."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "shoes"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
