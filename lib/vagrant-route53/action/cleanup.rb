require 'chef/config'
require 'chef/rest'
require 'chef/api_client'

module Vagrant
  module Route53
    module Action
      class Cleanup
        include ::Vagrant::Route53::EnvHelpers

        def initialize(app, env)
          @app = app
        end

        def old_record(env)
          # Need to move old_record format to config in Vagrant
          # Audax one: #{node.name}-#{node[:ec2][:instance_id]}.#{node.chef_environment}.#{node[:ec2][:placement_availability_zone]}.#{node[:route53][:infra_domain]}
          @old_record ||= chef_provisioner(env).node_name || vm_config(env).hostname || vm_config(env).box
        end

        def delete_resource(resource, env)
          begin
            # route53_api(env).delete_rest("#{resource}s/#{old_record(env)}")
            env[:route53].ui.success "Chef #{resource} '#{old_record(env)}' successfully purged from Route53..."
          rescue Exception => e
            env[:route53].ui.warn "Could not remove #{resource} #{old_record(env)}: #{e.message}"
          end
        end

        def call(env)
          if chef_client?(env)
            begin
              ::Chef::Config.from_file knife_config_file(env)
            rescue Errno::ENOENT => e
              raise ::Vagrant::Route53::VagrantWrapperError.new(e)
            end

            %w(record).each { |resource| delete_resource(resource, env) }
          end

          @app.call(env)
        end
      end
    end
  end
end
