module Vagrant
  module Route53
    class Env
      attr_accessor :ui
      
      def initialize
        if Gem::Version.new(::Vagrant::VERSION) >= Gem::Version.new("1.2")
          @ui = ::Vagrant::UI::Colored.new.scope('Route53')
        else
          @ui = ::Vagrant::UI::Colored.new('Route53')
        end
      end
    end
  end
end
