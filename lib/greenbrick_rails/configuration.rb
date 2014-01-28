module GreenbrickRails
  class Configuration
    attr_accessor :storage

    def initialize
      @storage = Storage.new
    end
    
    class Storage
      attr_accessor :type , :engine

      def initialize
        @type = :null
      end

      def engine
        @engine ||= begin
          type_name = "Greenbrick::Storage::#{@type.to_s.capitalize}"
          type_name.constantize
        end
      end
    end
  end
end