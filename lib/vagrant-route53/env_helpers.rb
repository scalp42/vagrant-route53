module Vagrant
  module Route53
    module EnvHelpers
      def vm_config(env)
        @vm_config ||= env[:machine].config.vm
      end

      def route53_api(env)
        # ROUTE53 AWS LOGIC
      end

      def chef_provisioner(env)
        @chef_provisioner ||= vm_config(env).provisioners.find do |p|
          p.config.is_a? VagrantPlugins::Chef::Config::ChefClient
        end.config
      end

      def chef_client?(env)
        vm_config(env).provisioners.select { |p| p.name == :chef_client }.any?
      end

      def knife_config_file(env)
        # Make sure that the default is set
        env[:machine].config.route53.finalize!

        env[:route53].ui.info "knife.rb location set to '#{env[:machine].config.route53.knife_config_file}'"
        env[:machine].config.route53.knife_config_file
      end
    end
  end
end
