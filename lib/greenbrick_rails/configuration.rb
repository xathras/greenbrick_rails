module GreenbrickRails
  class Configuration
    attr_accessor :storage

    def initialize
      @storage = Storage.new
    end
    
    class Storage
      attr_accessor :type , :engine , :settings
      attr_accessor :settings_map

      def initialize
        @type = :null
        @settings_map = {
          yaml:  { filename: '' },
          redis: { key_space: '' , redis_client_options: {} }
        }
      end

      def engine
        @engine ||= begin
          type_name = "Greenbrick::Storage::#{@type.to_s.capitalize}"
          load_default_settings
          type_name.constantize
        end
      end

      def engine_instance
        @engine_instance ||= self.engine.new *@settings
      end

      def type=(val)
        @type = val
        load_default_settings
        @type
      end

    private
      def load_default_settings
        @settings ||= StorageConfiguration.new @settings_map[@type]
      end
    end
  end
end