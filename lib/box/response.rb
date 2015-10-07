require 'json'

module Box
  class Response

    def self.for(opts)
      new(JSON.parse(opts))
    end

    def initialize(opts)
      @opts = opts
    end

    def status
      @opts['stat'] == 'ok'
    end

    def method_missing(method_sym, *arguments, &block)
      if @opts['result'][method_sym.to_s]
        return @opts['result'][method_sym.to_s]
      end

      super
    end

    private

    def opts
      @opts
    end
  end
end
