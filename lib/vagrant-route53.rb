require 'vagrant'
require 'vagrant-route53/version'
require 'vagrant-route53/errors'

module Vagrant
  module Route53
    autoload :Action,     'vagrant-route53/action'
    autoload :Config,     'vagrant-route53/config'
    autoload :Env,        'vagrant-route53/env'
    autoload :EnvHelpers, 'vagrant-route53/env_helpers'
  end
end

require 'vagrant-route53/plugin'
