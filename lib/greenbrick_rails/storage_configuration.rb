module GreenbrickRails
  class StorageConfiguration
    def initialize( defaults = {} )
      @config_hash = HashWithIndifferentAccess.new( defaults )
    end

    def method_missing(method, *args, &block)
      if @config_hash.has_key?( method )
        return @config_hash[method]
      end
      if method =~ /\A([A-Za-z_0-9]+)=\Z/ && @config_hash.has_key?( $1 )
        return @config_hash[$1] = args.first
      end
      super
    end

    def respond_to_missing?( method , include_private = false )
      @config_hash.has_key?( method ) || super
    end

    def to_a
      @config_hash.values
    end
  end
end