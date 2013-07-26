# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-route53/version'

Gem::Specification.new do |gem|
  gem.name          = "vagrant-route53"
  gem.version       = Vagrant::Route53::VERSION
  gem.authors       = ["Anthony Scalisi"]
  gem.email         = ["scalisia@gmail.com"]
  gem.description   = %q{Delete route53 record associated to the ec2 node when destroying Vagrant VM.}
  gem.summary       = %q{If a Vagrant VM that was spun up using the AWS provider is destroyed and uses the route53 cookbook, it will leave behind the node route53 record. What vagrant-route53 does is to clean up those previous records during the destroy operation.}
  gem.homepage      = "https://github.com/scalp42/vagrant-route53"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency "chef", ">= 11.2.0"
  
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "pry-debugger"
  gem.add_development_dependency "bundler", "~> 1.3"
end
