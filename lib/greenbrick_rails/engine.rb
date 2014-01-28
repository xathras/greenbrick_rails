module GreenbrickRails
  class Engine < ::Rails::Engine
    isolate_namespace GreenbrickRails

    class << self
      attr_accessor :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield( configuration ) if block_given?
      end
    end
  end
end