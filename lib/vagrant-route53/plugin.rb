module Vagrant
  module Route53
    class Plugin < Vagrant.plugin('2')
      name "vagrant-route53"
      description <<-DESC
      Delete Route53 record associated to the EC2 node when destroying Vagrant VM using AWS provider.
      DESC
      
      action_hook(:vagrant_route53_cleanup, :machine_action_destroy) do |hook|
        hook.after(::Vagrant::Action::Builtin::ConfigValidate, Vagrant::Route53::Action.cleanup)
      end
      
      config("route53") do
        Config
      end
    end
  end
end
