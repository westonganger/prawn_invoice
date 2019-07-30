lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prawn_invoice/version"

Gem::Specification.new do |s|
  s.name          = "prawn_invoice"
  s.version       = PrawnInvoice::VERSION
  s.authors       = ["Weston Ganger"]
  s.email         = ["weston@westonganger.com"]

  s.homepage 	= 'https://github.com/westonganger/prawn_invoice'
  
  s.summary     = "Dead simple Prawn based PDF invoice generator with support for custom invoice templates"

  s.description = s.summary 

  s.files = Dir.glob("{lib/**/*}") + %w{ LICENSE README.md Rakefile CHANGELOG.md }
  s.test_files  = Dir.glob("{test/**/*}")
  s.require_path = 'lib'

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency "prawn"

  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "minitest", "~> 5.0"
end
