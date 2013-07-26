module Vagrant
  module Route53
    module Action
      autoload :Cleanup, 'vagrant-route53/action/cleanup'
      
      def self.cleanup
        ::Vagrant::Action::Builder.new.tap do |b|
          b.use setup
          b.use Vagrant::Route53::Action::Cleanup
        end
      end

      def self.setup
        @setup ||= ::Vagrant::Action::Builder.new.tap do |b|
          b.use ::Vagrant::Action::Builtin::EnvSet, route53: Vagrant::Route53::Env.new
        end
      end
    end
  end
end
